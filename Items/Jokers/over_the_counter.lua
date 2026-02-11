local over_the_counter = {
    object_type = "Joker",
    order = 535,
    key = "over_the_counter",
    config = {
        extra = {
            cards_to_draw = 1
        }
    },
    rarity = 2,
    pos = { x = 19, y = 25 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    pixel_size = { w = 53, h = 93 },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cards_to_draw,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.open_booster then
            if context.card.config.center.draw_hand then
                local triggers = math.min(card.ability.extra.cards_to_draw, #G.deck.cards)
                for i = 1, triggers do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        func = function()
                            G.SETTINGS.paused = true
                            G.FUNCS.overlay_menu {
                                config = { no_esc = true },
                                definition = SMODS.jest_no_back_card_collection_UIBox(
                                    G.deck.cards,
                                    { 5, 5, 5 },
                                    {
                                        no_materialize = true,
                                        from_area = true,
                                        hide_single_page = true,
                                        collapse_single_page = true,
                                        modify_card = function(card, center, i, j, pool, index)
                                            jest_create_select_card_ui(card, G.hand, {
                                                    playing_card = true,
                                                    draw_from = pool,
                                                    index = index,
                                                },
                                                "jest_select_haruspex"
                                            )
                                        end,
                                        sort = function(table_to_sort)
                                            pseudoshuffle(table_to_sort, pseudoseed('j_file'))
                                            table.sort(table_to_sort, function (a, b) return a:get_nominal('suit') > b:get_nominal('suit') end )
                                        end,
                                        h_mod = 1.05,
                                    }
                                ),
                            }
                            return true
                        end
                    }))
                end
            end
        end
    end
}

return { name = { "Jokers" }, items = { over_the_counter } }
