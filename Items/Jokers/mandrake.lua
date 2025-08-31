local mandrake = {
    object_type = "Joker",
    order = 235,

    key = "mandrake",
    config = {
        extra = {
            rounds = 0,
            total_rounds = 2
        }
    },
    rarity = 1,
    pos = { x = 3, y = 9 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.rounds,
                card.ability.extra.total_rounds
            }
        }
    end,

    calculate = function(self, card, context)
        if context.selling_self and (card.ability.extra.rounds >= card.ability.extra.total_rounds) and not context.blueprint then
            if G.hand and G.hand.cards then
                for k, v in ipairs(G.hand.cards) do
                    v:start_dissolve()
                end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.rounds = card.ability.extra.rounds + 1
            if card.ability.extra.rounds == card.ability.extra.total_rounds then
                local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
            end
            return {
                message = (card.ability.extra.rounds < card.ability.extra.total_rounds) and
                    (card.ability.extra.rounds .. '/' .. card.ability.extra.total_rounds) or
                    localize('k_active_ex'),
                colour = G.C.FILTER
            }
        end
    end

}
return { name = { "Jokers" }, items = { mandrake } }
