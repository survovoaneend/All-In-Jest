local croupier = {
    object_type = "Joker",
    order = 327,
    key = "croupier",
    config = {
        extra = {
            money = 10,
            total_chips = "0"
        }
    },
    rarity = 1,
    pos = { x = 23, y = 12},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.jest_scored_chips and not context.blueprint then
            card.ability.extra.total_chips = tostring(tonumber(card.ability.extra.total_chips) + context.jest_scored_chips)
        end

        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            if tonumber(card.ability.extra.total_chips) > (to_big(G.GAME.blind.chips) * 2) then
                return {
                    card = card,
                    dollars = card.ability.extra.money,
                }
            end
        end
    end
  
}
local evaluate_playref = G.FUNCS.evaluate_play
function G.FUNCS.evaluate_play(self, e)
    evaluate_playref(self, e)

    for i = 1, #G.jokers.cards do
        local effects = eval_card(G.jokers.cards[i], {
            card = G.consumeables,
            after = true,
            jest_scored_chips = to_big(hand_chips * mult)
        })
        if effects.jokers then
            card_eval_status_text(G.jokers.cards[i], "jokers", nil, 0.3, nil, effects.jokers)
        end
    end
end
return { name = {"Jokers"}, items = {croupier} }
