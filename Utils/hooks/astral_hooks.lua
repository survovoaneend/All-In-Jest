
SMODS.ConsumableType({
    key = 'aij_astral',
    primary_colour = HEX("d1e2f6"),
    secondary_colour = HEX("87a5c9"),
    collection_rows = {5, 4},
    shop_rate = 0,
    default = 'c_aij_algol',
    no_buy_and_use = false,
    inject_card = function(self, center)
        local set_ability_ref = center.set_ability
        center.set_ability = function(self, card, initial, delay_sprites)
            card.ability = copy_table(card.ability)
            local center_cfg = card.config.center
            local grade = All_in_Jest.astral_set_grade(center_cfg.all_in_jest and center_cfg.all_in_jest.grades)
            card.ability.consumeable.grade = grade
            card.ability.consumeable.hand = All_in_Jest.astral_hand_from_grade(grade)

            if set_ability_ref then
                return set_ability_ref(self, card, initial, delay_sprites)
            end
        end

        if not center.loc_vars_astral_applied then
            center.loc_vars_astral_applied = true
            local loc_vars_ref = center.loc_vars
            center.loc_vars = function(self, info_queue, card)
                local pin_count = 0
                if G.GAME.Astral_pins and #G.GAME.Astral_pins and card.ability.consumeable and card.ability.consumeable.hand then 
                    pin_count = #G.GAME.Astral_pins[card.ability.consumeable.hand] or 0 
                end
                local pins_left = math.max((G.GAME.all_in_jest.astral_pin_per_hand or 3) - pin_count, 0)


                local ret = {}
                if loc_vars_ref then
                    ret = loc_vars_ref(self, info_queue, card)
                end

                if card.area and not card.area.config.collection then
                    if card.ability.consumeable.hand and card.ability.consumeable.grade then
                        if card.ability.consumeable.grade == 'Retrograde' then
                            card.ability.consumeable.hand = All_in_Jest.astral_hand_from_grade('Retrograde')
                        end
                        info_queue[#info_queue+1] = {key = 'aij_astral_'..string.lower(card.ability.consumeable.grade), set = 'Other'}
                    end
                    
                    ret.main_end = ret.main_end or {}
                    ret.main_end[#ret.main_end + 1] = {n = G.UIT.R, config = {align = "cm"}, nodes = {
                        {n = G.UIT.R, config = {align = "cm", padding = 0.02}, nodes = {
                            {n = G.UIT.T, config = {text = localize{type = "variable", key = "a_aij_slots_left", vars = {pins_left}}, colour = G.C.UI.TEXT_INACTIVE, scale = 0.32}},
                        }}
                    }}
                end

                return ret
            end
        end
        
        if not center.can_use then
            center.can_use = function(self, card)
                return true 
            end
        end
        if not center.use then
            center.use = function(self, card, area, copier)
                All_in_Jest.use_astral_card(card)
                if G.aij_cur_astral_hand and G.aij_cur_astral_hand == card.ability.consumeable.hand and G.GAME.Astral_pins then
                    if G.aij_astral_pin_area and #G.aij_astral_pin_area.cards > 0 then
                        All_in_Jest.astral_visuals(card.ability.consumeable.hand, 'only_remove', All_in_Jest.old_colours or nil, true)      
                        for _, v in pairs(G.aij_astral_pin_area.cards) do
                            v:remove()
                        end
                    end
                    All_in_Jest.astral_visuals(card.ability.consumeable.hand, 'no_remove')
                end
            end
        end
        SMODS.ObjectType.inject_card(self, center)
    end,
})

SMODS.UndiscoveredSprite({
    key = 'aij_astral',
    atlas = 'consumable_atlas',
    pos = { x = 15, y = 4 },
    overlay_pos = { x = 16, y = 4 },
})


G.Astral = {} -- stores Astral pins
All_in_Jest.Astral = SMODS.Tag:extend {
    set = 'aij_astral',
    is_pin = true,
    atlas = 'consumable_atlas',
    class_prefix = 'c',
    in_pool = function() return false end,
    inject = function(self)
        G.Astral[self.pin] = self
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        if not card then
            card = self:create_fake_card()
        end
        local set_check = self.alt_set or self.set
        local target = {
            type = 'descriptions',
            key = self.key,
            set = set_check,
            nodes = desc_nodes,
            AUT = full_UI_table,
            vars =
                specific_vars or {}
        }
        local res = {}
        if self.loc_vars and type(self.loc_vars) == 'function' then
            res = self:loc_vars(info_queue, card) or {}
            target.vars = res.vars or target.vars
            target.key = res.key or target.key
            target.set = res.set or target.set
            target.scale = res.scale
            target.text_colour = res.text_colour
        end

        if desc_nodes == full_UI_table.main and not full_UI_table.name then
            full_UI_table.name = set_check == 'Enhanced' and 'temp_value' or localize { type = 'name', set = target.set, key = res.name_key or target.key, nodes = full_UI_table.name, vars = res.name_vars or target.vars or {} }
        elseif desc_nodes ~= full_UI_table.main and not desc_nodes.name and set_check ~= 'Enhanced' then
            desc_nodes.name = localize{type = 'name_text', key = res.name_key or target.key, set = target.set }
        end
        if specific_vars and specific_vars.debuffed and not res.replace_debuff then
            target = { type = 'other', key = 'debuffed_' ..
            (specific_vars.playing_card and 'playing_card' or 'default'), nodes = desc_nodes, AUT = full_UI_table, }
        end
        if res.main_start then
            desc_nodes[#desc_nodes + 1] = res.main_start
        end

        localize(target)
            
        if res.main_end then
            desc_nodes[#desc_nodes + 1] = res.main_end
        end
        desc_nodes.background_colour = res.background_colour
    end
}

local aij_ease_bg_blind_ref = ease_background_colour_blind
function ease_background_colour_blind(state, blind_override)
    All_in_Jest.old_colours = nil
    aij_ease_bg_blind_ref(state, blind_override)
end

local aij_ease_bg_ref = ease_background_colour
function ease_background_colour(args)
    if All_in_Jest.old_colours == nil then
        All_in_Jest.old_colours = {
            special_colour = copy_table(args['special_colour']),
            tertiary_colour = copy_table(args['tertiary_colour']),
            new_colour = copy_table(args['new_colour']),
            contrast = args.contrast or 1,
        }
    end
    aij_ease_bg_ref(args)
end

local aij_game_update_astral_ref = Game.update
function Game:update(dt)
    local ref = aij_game_update_astral_ref(self, dt)
    if G.GAME.Astral_pins and G.hand and #G.hand.highlighted <= 0 and G.aij_cur_astral_hand ~= nil and G.play and #G.play.cards <= 0 and G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND then
        All_in_Jest.astral_visuals(text, 'only_remove', All_in_Jest.old_colours or nil, true)      
        G.aij_cur_astral_hand = nil
        if G.aij_astral_pin_area then
            for _, v in pairs(G.aij_astral_pin_area.cards) do
                v:remove()
            end
        end
    end
    return ref
end

-- Hook to make astral pins move out of the way outside of a round
local aij_cardarea_move_ref = CardArea.move
function CardArea:move(dt)
    local ret = aij_cardarea_move_ref(self, dt)

    if self == G.aij_astral_pin_area then 
        local desired_y = G.ROOM.T.h/4
        if not (G.STATE == G.STATES.SELECTING_HAND or G.STATE == G.STATES.HAND_PLAYED or G.STATE == G.STATES.DRAW_TO_HAND) then
            desired_y = desired_y * -1
        end
        G.aij_astral_pin_area.T.y = desired_y
    end

    return ret
end


local aij_create_UIBox_hand_tip_ref = create_UIBox_hand_tip
function create_UIBox_hand_tip(handname)
    ret = aij_create_UIBox_hand_tip_ref(handname)

    -- Show applied astral pins
    local astrals = 0
    if G.GAME and G.GAME.Astral_pins and G.GAME.Astral_pins[handname] then
        for _, _ in pairs(G.GAME.Astral_pins[handname]) do
            astrals = astrals + 1
        end
    end
    if astrals > 0 then
        local astral_pins_cardarea = CardArea(
            2, 2,
            3.5*G.CARD_W,
            0.5*G.CARD_H, 
            {card_limit = 3, type = 'title', highlight_limit = 0})

        if G.GAME.Astral_pins[handname] then
            local v = G.GAME.Astral_pins[handname]
            for _, i in pairs(v) do
                local center = G.Astral[i.pin]
                local card = Card(astral_pins_cardarea.T.x + astral_pins_cardarea.T.w/2,
                astral_pins_cardarea.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, center, {bypass_discovery_center = true, bypass_discovery_ui = true})
                card.config.center_key = i.pin
                for k_, vi in pairs(card.config.center.config) do
                    card.ability[k_] = vi 
                end
                for k_, vi in pairs(G.GAME.Astral_pins[handname][_].ability) do
                    card.ability[k_] = vi 
                end
                card.ability.extra.hand = handname
                card.config.center.set_card_type_badge = function(self, card, badges)
                    badges = {}
                end
                astral_pins_cardarea:emplace(card)
                card:start_materialize()
            end
        end

        ret = {n=G.UIT.R, config={align = "cm", r = 0.1}, nodes={
                {n=G.UIT.R, config={align = "cm", colour = G.C.WHITE, r = 0.1}, nodes={
                    {n=G.UIT.C, config={align = "cm"}, nodes={
                        {n=G.UIT.O, config={object = astral_pins_cardarea}}
                    }}
                }},
                ret
            }}
    end

    return ret
end
