G.FUNCS.jest_select_haruspex = function(e)
    local c1 = e.config.ref_table
    if c1 and c1:is(Card) then
        draw_card(G.deck, G.hand, nil, 'up', true, e.config.data[2].draw_from[e.config.data[2].index], 0)
        -- G.SETTINGS.paused = false
        -- if G.OVERLAY_MENU ~= nil then
        --     G.OVERLAY_MENU:remove()
        --     G.OVERLAY_MENU = nil
        -- end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            func = function()
                -- draw_card(G.deck, G.hand, nil, 'up', true, e.config.data[2].draw_from[e.config.data[2].index], 0)
                G.SETTINGS.paused = false
                if G.OVERLAY_MENU ~= nil then
                    G.OVERLAY_MENU:remove()
                    G.OVERLAY_MENU = nil
                end
                return true
            end
        }))
    end
end

local haruspex = {
    object_type = "Joker",
    order = 77,

    key = "haruspex",
    config = {
        extra = {
            discards_to_spend = 1,
            cards_to_draw = 3
        }
    },
    rarity = 2,
    pos = { x = 22, y = 2 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local to_draw = G.deck and #G.deck.cards > 0 and math.min(card.ability.extra.cards_to_draw, #G.deck.cards) or card.ability.extra.cards_to_draw
        return {
            vars = {
                card.ability.extra.discards_to_spend,
                to_draw,
                colours = {
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,

    all_in_jest = {
        can_use_ability = function(self, card, context)
            if G.deck and G.deck.cards and #G.deck.cards > 0 and G.GAME.current_round.discards_left >= card.ability.extra.discards_to_spend and G.STATE == G.STATES.SELECTING_HAND then
                return true
            end
        end,

        use_ability = function(self, card)
            ease_discard(-1 * card.ability.extra.discards_to_spend)
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
                                        pseudoshuffle(table_to_sort, pseudoseed('haruspex'))
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
        end,
    },

    calculate = function(self, card, context)

    end

}
return { name = { "Jokers" }, items = { haruspex } }
