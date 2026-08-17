local autogenes = {
    object_type = "Joker",
    order = 765,

    key = "autogenes",
    config = {
        extra = {
            draw_amt = 1,
            choose_amt = 3
        }
    },
    attributes = { 'draw_cards', 'choice' },
    rarity = 2,
    pos = { x = 20, y = 46},
    soul_pos = { x = 21, y = 46},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.choose_amt,
                card.ability.extra.draw_amt
            }
        }
    end,

    calculate = function(self, card, context)
        if context.hand_drawn and G.deck and #G.deck.cards > 0 then
            local triggers = math.min(card.ability.extra.draw_amt, #G.deck.cards)
            for i = 1, triggers do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                        local chosen_cards = {}
                        for i = 1, math.min(3, #G.deck.cards) do
                            local vaild_cards = {}
                            for k, v in pairs(G.deck.cards) do
                                if #chosen_cards <= 0 then
                                    vaild_cards[#vaild_cards+1] = v
                                else
                                    for _k, _v in pairs(chosen_cards) do
                                        if _v ~= v then
                                            vaild_cards[#vaild_cards+1] = v
                                        end
                                    end
                                end
                            end
                            chosen_cards[#chosen_cards+1] = pseudorandom_element(vaild_cards, pseudoseed('jest_autogenes'))
                        end
                        G.SETTINGS.paused = true
                        G.FUNCS.overlay_menu {
                            config = { no_esc = true },
                            definition = SMODS.jest_no_back_card_collection_UIBox(
                                chosen_cards,
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
}
return { name = {"Jokers"}, items = {autogenes} }