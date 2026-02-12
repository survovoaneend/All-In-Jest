local bizco = {
    object_type = "Joker",
    order = 1063,

    key = "bizco",
    config = {
        extra = {
            extra_scoring_cards = 5
        }
    },
    rarity = 4,
    pos = { x = 1, y = 12 },
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 1, y = 13 },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.extra_scoring_cards}}
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            for i = 1, math.min(card.ability.extra.extra_scoring_cards, #G.hand.cards) do
                local percent = i
                highlight_card(G.hand.cards[i], (percent - 0.999) / #G.hand.cards)
            end
        end
        -- Destroy glass cards
        if context.destroy_card and context.cardarea == G.hand then
            for i = 1, math.min(card.ability.extra.extra_scoring_cards, #G.hand.cards) do
                local target_card = G.hand.cards[i]
                if context.destroy_card == target_card then
                    local new_context = {
                        full_hand = context.full_hand,
                        scoring_hand = context.scoring_hand,
                        scoring_name = context.scoring_name,
                        poker_hands = context.poker_hands,
                        destroy_card = context.destroy_card,
                        destroying_card = context.destroy_card,
                        cardarea = G.play,
                    }
                    return SMODS.calculate_context(new_context)
                end
            end
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card == context.scoring_hand[#context.scoring_hand] and not context.repetition then
                local juiced_card = context.blueprint_card or card
                return {
                    card = juiced_card,
                    func = function()
                        for i = 1, math.min(card.ability.extra.extra_scoring_cards, #G.hand.cards) do
                            local target_card = G.hand.cards[i]
                            if target_card then
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        juiced_card:juice_up()
                                        return true
                                    end
                                }))
                                local new_context = {
                                  cardarea = context.cardarea,
                                  full_hand = context.full_hand,
                                  scoring_hand = context.scoring_hand,
                                  scoring_name = context.scoring_name,
                                  poker_hands = context.poker_hands
                                }
                                SMODS.score_card(target_card, new_context)
                            end
                        end
                    end
                }
            end
        end

        if context.after and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local percent = 1
                    for i = 1, #G.hand.cards do
                        if G.hand.cards[i].highlighted then
                            highlight_card(G.hand.cards[i], (percent - 0.999) / #G.hand.cards, 'down')
                            percent = percent + 1
                        end
                    end
                    return true
                end
            }))
        end
    end,
}
return { name = { "Jokers" }, items = { bizco } }
