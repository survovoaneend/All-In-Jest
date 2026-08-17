local kalyptos = {
    object_type = "Joker",
    order = 766,
    ignore = true,
    key = "kalyptos",
    config = {
        future_sense = 5
    },
    attributes = { 'activated', 'future_sense', },
    rarity = 2,
    pos = { x = 22, y = 46},
    soul_pos = { x = 23, y = 46},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    all_in_jest = {
        can_use_ability = function(self, card, context)
            return G.deck and #G.deck.cards > 1
        end,

        use_ability = function(self, card, args)
            args = args or {}
            if not args.retriggered then 
                local new_order = {}
                for i = #G.deck.cards, 1, -1 do
                    new_order[#new_order+1] = G.deck.cards[i]
                end
                for i = 1, #G.deck.cards do
                    for k, v in pairs(new_order) do
                        if k == i then
                            table.remove(G.deck.cards, i)
                            table.insert(G.deck.cards, i, v)
                        end
                    end
                end
            end
        end,
    },

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.future_sense,
                colours = { 
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,

    calculate = function(self, card, context)

    end,
    generate_ui = function(self, info_queue, cardd, desc_nodes, specific_vars, full_UI_table)
        SMODS.Joker.super.generate_ui(self, info_queue, cardd, desc_nodes, specific_vars, full_UI_table)
        if G.deck ~= nil and cardd and cardd.area and cardd.area.config.type == "joker" then
            local cards = {}
            for i = #G.deck.cards, #G.deck.cards - cardd.ability.future_sense + 1, -1 do
                if i > 0 then
                    local card = copy_card(G.deck.cards[i], nil, nil, G.playing_card)

                    -- Re-adds negative to preview if it was stripped by the mod
                    if G.deck.cards[i].edition and G.deck.cards[i].edition.negative and not All_in_Jest.config.no_copy_neg then
                        card:set_edition({negative = true}, nil, true)
                    end

                    card.facing = 'front'

                    table.insert(cards,card)
                end
            end
            AllInJest.card_area_preview(nil,desc_nodes,{
                override = true,
                cards = cards,
                w = 2.4,
                h = 0.4,
                ml = 0,
                scale = 0.4,
            })
        end
    end,
}
return { name = {"Jokers"}, items = {kalyptos} }