local bizco = {
    object_type = "Joker",
    order = 1063,

    key = "bizco",
    config = {

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

    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            for i = 1, math.min(5, #G.hand.cards) do
                local percent = i
                highlight_card(G.hand.cards[i], (percent - 0.999) / #G.hand.cards)
            end
        end
        if context.individual and context.cardarea == G.play then

            if context.other_card == context.scoring_hand[#context.scoring_hand] and not context.repetition then
                local juiced_card = context.blueprint_card or card
                return {
                    card = juiced_card,
                    func = function()
                        for i = 1, math.min(5, #G.hand.cards) do
                            local target_card = G.hand.cards[i]
                            if target_card then
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        juiced_card:juice_up()
                                        return true
                                    end
                                }))
                                SMODS.score_card(target_card, context)
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
