local hangman = {
    object_type = "Joker",
    order = 643,
    key = "hangman",

    config = {
        extra = {
            inactive_rounds = 0,
            max_inactive = 3,
            triggered_this_round = false
        }
    },
    attributes = {'tarot'},
    rarity = 2,
    pos = { x = 0, y = 29 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_hanged_man
        info_queue[#info_queue + 1] = G.P_CENTERS.c_death

        local hang_card = G.GAME.current_round.aij_hangman_card or { rank = 'Ace', suit = 'Spades' }
        local remaining_rounds = card.ability.extra.max_inactive - (card.ability.extra.inactive_rounds or 0)

        return { 
            vars = {
                localize(hang_card.rank, 'ranks'),
                localize(hang_card.suit, 'suits_plural'),
                remaining_rounds,
                colours = { G.C.SUITS[hang_card.suit] }
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.before then
            local target = G.GAME.current_round.aij_hangman_card or { id = 14, suit = 'Spades' }
            local contains_target = false

            for _, played_card in ipairs(context.full_hand) do
                if played_card:get_id() == target.id and played_card:is_suit(target.suit) then
                    contains_target = true
                    break
                end
            end

            if contains_target then
                if not context.blueprint then
                    card.ability.extra.triggered_this_round = true
                    card.ability.extra.inactive_rounds = 0
                end

                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                            SMODS.add_card {
                                key = 'c_hanged_man',
                                set = 'Tarot',
                                key_append = 'aij_hangman'
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end)
                    }))
                    return {
                        message = localize('k_plus_tarot'),
                        colour = G.C.SECONDARY_SET.Tarot,
                        card = card
                    }
                end
            end
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.triggered_this_round then
                card.ability.extra.triggered_this_round = false
                card.ability.extra.inactive_rounds = 0
            else
                card.ability.extra.inactive_rounds = card.ability.extra.inactive_rounds + 1
                if card.ability.extra.inactive_rounds >= card.ability.extra.max_inactive then
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                SMODS.add_card {
                                    key = 'c_death',
                                    set = 'Tarot',
                                    key_append = 'aij_hangman_death'
                                }
                                G.GAME.consumeable_buffer = 0
                                return true
                            end)
                        }))
                    end

                    SMODS.destroy_cards(card, nil, nil, true)
                    return {
                        message = localize('k_plus_tarot'),
                        colour = G.C.SECONDARY_SET.Tarot,
                    }
                else
                    return {
                        message = card.ability.extra.inactive_rounds .. '/' .. card.ability.extra.max_inactive
                    }
                end
            end
        end
    end
}
return { name = {"Jokers"}, items = {hangman} }
