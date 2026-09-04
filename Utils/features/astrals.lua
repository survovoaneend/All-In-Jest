

--Sets an Astral cards grade
function All_in_Jest.astral_set_grade(rarity)
    local rand_val = pseudorandom('aij_astral_grade')
    
    rarity = rarity or {["Retrograde"] = 0.1, ["Passigrade"] = 0.45}
    
    local retro_chance = rarity["Retrograde"] or 0
    local passi_chance = rarity["Passigrade"] or 0
    
    -- Check probabilities sequentially so they don't overwrite each other
    if rand_val <= retro_chance then
        return "Retrograde"
    elseif rand_val <= (retro_chance + passi_chance) then
        return "Passigrade"
    else
        return "Prograde"
    end
end

-- Gets hand from grade type
function All_in_Jest.astral_hand_from_grade(grade, cur_hand)
    local _hand = "High Card"
    if G.GAME.hands and G.handlist then 
        if grade == "Retrograde" then
            local _tally = 0
            for k, v in ipairs(G.handlist) do
                if SMODS.is_poker_hand_visible(v) and G.GAME.hands[v].played >= _tally then
                    _hand = v
                    _tally = G.GAME.hands[v].played
                end
            end
        elseif grade == "Prograde" then 
            local _remove_tally = 0
            for k, v in ipairs(G.handlist) do
                if SMODS.is_poker_hand_visible(v) and G.GAME.hands[v].played >= _remove_tally then
                    _remove_tally = G.GAME.hands[v].played
                end
            end
            local vaild_hands = {}
            for k, v in ipairs(G.handlist) do
                if SMODS.is_poker_hand_visible(v) and G.GAME.hands[v].played < _remove_tally then
                    vaild_hands[#vaild_hands+1] = v
                end
            end
            if #vaild_hands <= 0 then
                for k, v in ipairs(G.handlist) do
                    if SMODS.is_poker_hand_visible(v) then
                        vaild_hands[#vaild_hands+1] = v
                    end
                end
            end
            _hand = cur_hand or pseudorandom_element(vaild_hands, pseudoseed(grade))
        elseif grade == "Passigrade" then
            local vaild_hands = {}
            for k, v in ipairs(G.handlist) do
                if SMODS.is_poker_hand_visible(v) then
                    vaild_hands[#vaild_hands+1] = v
                end
            end
            _hand = cur_hand or pseudorandom_element(vaild_hands, pseudoseed(grade))
        end
    end
    return _hand
end

function All_in_Jest.create_astral_pin(card, index)
    local index = index or #G.GAME.Astral_pins[card.ability.consumeable.hand]+1
    G.GAME.Astral_pins[card.ability.consumeable.hand][index] = {}
    G.GAME.Astral_pins[card.ability.consumeable.hand][index]['pin'] = card.ability.consumeable.pin
    G.GAME.Astral_pins[card.ability.consumeable.hand][index].ability = {}
    G.GAME.Astral_pins[card.ability.consumeable.hand][index].ability.extra = card.ability.extra
end

function All_in_Jest.use_astral_card(card)
    if G.GAME.Astral_pins[card.ability.consumeable.hand] and #G.GAME.Astral_pins[card.ability.consumeable.hand] >= G.GAME.all_in_jest.astral_pin_per_hand then
        if G.GAME.Astral_pins and G.aij_astral_pin_area and #G.aij_astral_pin_area.cards > 0 then
            All_in_Jest.astral_visuals(card.ability.consumeable.hand, 'only_remove', All_in_Jest.old_colours or nil, true)      
            for _, v in pairs(G.aij_astral_pin_area.cards) do
                v:remove()
            end
        end
        if G.GAME.Astral_pins then
            All_in_Jest.astral_visuals(card.ability.consumeable.hand, 'no_remove')       
        end
        G.E_MANAGER:add_event(Event({
            func = function() 
                G.SETTINGS.paused = true
				G.FUNCS.overlay_menu{
                    config = {},
                    definition = SMODS.jest_no_back_card_collection_UIBox(
                        G.aij_astral_pin_area.cards, 
                        {6,6}, 
                        {
                            from_area = true,
                            card_scale = 1,
                            hide_single_page = true,
                            collapse_single_page = true,
                            modify_card = function(cardd, center) 
                                if cardd and cardd.config.center then
                                    cardd.bypass_discovery_center = true
                                    cardd.bypass_discovery_ui = true
                                    cardd:set_ability(cardd.config.center)
                                    for k, v in pairs(center.ability) do
                                        if type(v) == 'table' then 
                                            cardd.ability[k] = copy_table(v)
                                        else
                                            cardd.ability[k] = v
                                        end
                                    end
                                    local index = nil
                                    for k, v in pairs(G.aij_astral_pin_area.cards) do
                                        if v == center then
                                            index = k
                                        end
                                    end
                                    jest_create_select_card_ui(cardd, G.aij_astral_pin_area, {
                                        alt_text = localize('k_aij_replace'),
                                        alt_colour = HEX("87a5c9"),
                                        consumable_card = card,
                                        astral_index = index
                                    }, 'jest_astral_replace')
                                end
                            end, 
                            h_mod = 1.05,
                        }
                    ),
                }
                if G.GAME.Astral_pins then
                    All_in_Jest.astral_visuals(card.ability.consumeable.hand, 'only_remove', All_in_Jest.old_colours or nil, true)      
                    if G.aij_astral_pin_area then
                        for _, v in pairs(G.aij_astral_pin_area.cards) do
                            v:remove()
                        end
                    end
                end
                return true 
            end 
        }))
    else
        All_in_Jest.create_astral_pin(card)
    end
end

function All_in_Jest.astral_background(type, colours)
    if type then
        ease_background_colour{special_colour = darken(colours.background[1], 0.5), new_colour = colours.background[2], tertiary_colour = colours.background[3], contrast = 1}
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.26,blocking = false, blockable = false,
            func = function()
                G.aij_astral_stars = G.aij_astral_stars or Particles(1, 1, 0,0, {
                    timer = 0.07,
                    scale = 0.1,
                    initialize = true,
                    lifespan = 15,
                    speed = 0.1,
                    padding = -4,
                    attach = G.ROOM_ATTACH,
                    colours = colours.stars,
                    fill = true
                })
                G.aij_astral_meteors = G.aij_astral_meteors or Particles(1, 1, 0,0, {
                    timer = 2,
                    scale = 0.05,
                    lifespan = 1.5,
                    speed = 4,
                    attach = G.ROOM_ATTACH,
                    colours = {colours.stars[1]},
                    fill = true
                })
                return true
            end
        }))
    else
        ease_background_colour({special_colour = colours.background[1], tertiary_colour = colours.background[2], new_colour = colours.background[3], contrast = colours.background[4]})
        if G.aij_astral_stars then G.aij_astral_stars:fade(0.25) end
        if G.aij_astral_meteors then G.aij_astral_meteors:fade(0.25) end

        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.25,blocking = false, blockable = false,
            func = function()
                if G.aij_astral_stars then G.aij_astral_stars:remove(); G.aij_astral_stars = nil end
                if G.aij_astral_meteors then G.aij_astral_meteors:remove(); G.aij_astral_meteors = nil end
                return true
            end
        }))
    end
end


function All_in_Jest.astral_visuals(hand, extra, old_colours, immediate, colours)
    local old_colours = old_colours or {
        special_colour = copy_table(G.C.BACKGROUND.C),
        tertiary_colour = copy_table(G.C.BACKGROUND.D),
        new_colour = copy_table(G.C.BACKGROUND.L),
        contrast = 1,
    }
    colours = colours or {}
    if extra == 'only_color' then
        if not immediate then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 1,
                func = function()
                    All_in_Jest.astral_background(nil, {background = {old_colours.special_colour, old_colours.tertiary_colour, old_colours.new_colour, old_colours.contrast}})
                    return true
            end}))
        else
            All_in_Jest.astral_background(nil, {background = {old_colours.special_colour, old_colours.tertiary_colour, old_colours.new_colour, old_colours.contrast}})
        end
        return
    end
    if extra ~= 'only_remove' then
        -- Add astral pins
        local astrals = 0
        if G.GAME.Astral_pins[hand] then
            for _, _ in pairs(G.GAME.Astral_pins[hand]) do
                astrals = astrals + 1
            end
        end
        if astrals == 0 then
            All_in_Jest.astral_visuals(hand, 'only_remove', All_in_Jest.old_colours or old_colours, true)
            return
        end
        if G.GAME.Astral_pins[hand] then
            local k = hand
            local v = G.GAME.Astral_pins[hand]
            for _, i in pairs(v) do
                local center = G.Astral[i.pin]
                local card = Card(G.aij_astral_pin_area.T.x + G.aij_astral_pin_area.T.w/2,
                G.aij_astral_pin_area.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, center, {bypass_discovery_center = true, bypass_discovery_ui = true})
                card.config.center_key = i.pin
                for k_, vi in pairs(card.config.center.config) do
                    card.ability[k_] = vi 
                end
                for k_, vi in pairs(G.GAME.Astral_pins[k][_].ability) do
                    card.ability[k_] = vi 
                end
                card.ability.extra.hand = k
                card.config.center.set_card_type_badge = function(self, card, badges)
                    badges = {}
                end
                G.aij_astral_pin_area:emplace(card)
                card:start_materialize()
                -- We shouldn't need to do this but we have to anyway
                -- This is to make a couple pins juice when active
                local obj = card.config.center
                if obj and obj.add_to_deck and type(obj.add_to_deck) == 'function' then
                    obj:add_to_deck(card, from_debuff)
                end
            end
        end
        -- Change background colour
        All_in_Jest.astral_background(true, {background = colours.background or {HEX("d1e2f6"), HEX("87a5c9"), HEX("d1e2f6")}, stars = colours.stars or {G.C.WHITE, HEX('d1e2f6'), HEX('9ec5d7')}})
        delay(0.4)
    end
    if extra ~= 'no_remove' then
        if not immediate then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 1,
                func = function()
                    All_in_Jest.astral_background(nil, {background = {old_colours.special_colour, old_colours.tertiary_colour, old_colours.new_colour, old_colours.contrast}})
                    if G.aij_astral_pin_area then
                        for _, v in pairs(G.aij_astral_pin_area.cards) do
                            v:remove()
                        end
                    end
                    return true
            end}))
        else
            All_in_Jest.astral_background(nil, {background = {old_colours.special_colour, old_colours.tertiary_colour, old_colours.new_colour, old_colours.contrast}})
            if G.aij_astral_pin_area then
                for _, v in pairs(G.aij_astral_pin_area.cards) do
                    v:remove()
                end
            end
        end
    end
end