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
    pos = { x = 23, y = 12 },
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
        local current_hand_score = to_number(context.jest_scored_chips)
        print(current_hand_score)
        if current_hand_score > (to_number(G.GAME.blind.chips) * 2) then
            return {
                dollars = card.ability.extra.money, 
                card = card,
            }
        end
    end
    end

}
local evaluate_playref = G.FUNCS.evaluate_play
function G.FUNCS.evaluate_play(self, e)
    evaluate_playref(self, e)

    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].config.center_key == 'j_aij_croupier' then
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
end

return { name = { "Jokers" }, items = { croupier } }
