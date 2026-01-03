local get_last_destroyed_face_card = function (X, Y)
    X = X or 0
    Y = Y or 0
    for i = #G.GAME.all_in_jest.previously_destroyed_playing_cards, 1, -1 do
        local card = G.GAME.all_in_jest.previously_destroyed_playing_cards[i]
        local temporary_card = Card(X, Y, G.CARD_W, G.CARD_H, G.P_CENTERS.j_joker, G.P_CENTERS.c_base)
        temporary_card:load(card)
        if temporary_card:is_face() then
            return temporary_card
        else
            temporary_card:remove()
        end
    end
end

function reset_jest_visage_cards()
    for _, card in ipairs(G.playing_cards) do
        if card.ability.aij_visage_temporary then
            card:start_dissolve(nil, true)
        end
    end
end

local visage = {
    object_type = "Joker",
    order = 232,
    key = "visage",
    config = {
    },
    rarity = 2,
    pos = { x = 21, y = 8 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    generate_ui = function(self, info_queue, cardd, desc_nodes, specific_vars, full_UI_table)
        SMODS.Joker.super.generate_ui(self, info_queue, cardd, desc_nodes, specific_vars, full_UI_table)
        if G.deck ~= nil and cardd and cardd.area and cardd.area.config.type == "joker" then
            local cards = {}
            local temporary_card = get_last_destroyed_face_card()
            if temporary_card then
                -- Re-adds negative to preview if it was stripped by the mod
                if temporary_card.edition and temporary_card.edition.negative and not All_in_Jest.config.no_copy_neg then
                    temporary_card:set_edition({negative = true}, nil, true)
                end

                temporary_card.facing = 'front'

                table.insert(cards, temporary_card)
            end
            AllInJest.card_area_preview(nil,desc_nodes,{
                override = true,
                cards = cards,
                w = 1.0,
                h = 0.4,
                ml = 0,
                scale = 0.4,
            })
        end
    end,
  
    calculate = function(self, card, context)
        if context.before then
            local temporary_card = get_last_destroyed_face_card(card.T.x, card.T.y)
            if temporary_card then
                -- Creating a card this way to not trigger hologram and similar
                -- Unfortunately makes deck size label go up
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                temporary_card:add_to_deck()
                temporary_card.ability.aij_visage_temporary = true
                temporary_card.highlighted = true
                table.insert(G.playing_cards, temporary_card)

                G.play:emplace(temporary_card)
                temporary_card:start_materialize()
                table.insert(context.scoring_hand, temporary_card)

                local juice_card = context.blueprint_card or card
                juice_card:juice_up()
            end
        end
    end

}

local add_to_previously_destroyed_playing_cards = function(card)
    if card.ability.set == 'Default' or card.ability.set == 'Enhanced' then
        local save_data = copy_table(card:save())
        table.insert(G.GAME.all_in_jest.previously_destroyed_playing_cards, save_data) -- Store the joker saved so it does not get erased on game reload
    end
end

local aij_visage_shatter_ref = Card.shatter
function Card:shatter()
    local ref = aij_visage_shatter_ref(self)
    if (self.ability.set == 'Default' or self.ability.set == 'Enhanced') then
        add_to_previously_destroyed_playing_cards(self)
    end
    return ref
end

local aij_visage_start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
    local ref = aij_visage_start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
    -- Specific check to exclude the card that dissolved in the screen when you start the run
    if (self.ability.set == 'Default' or self.ability.set == 'Enhanced') and self ~= G.screenwipecard then
        add_to_previously_destroyed_playing_cards(self)
    end
    return ref
end

return { name = { "Jokers" }, items = { visage } }
