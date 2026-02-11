local shredded_joker = {
    object_type = "Joker",
    order = 506,
    key = "shredded_joker",
    
    config = {
        extra = {
            mult = 0,
            mult_gain = 1
        }
    },
    rarity = 1,
    pos = { x = 16, y = 24 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_gain,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.discard and not context.blueprint and not context.other_card.debuff then
             card.ability.extra.mult = card.ability.extra.mult + 1
             return {
                 message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_gain } },
                colour = G.C.MULT,
                delay = 0.2
             }
        end
        if context.end_of_round and not context.blueprint and card.ability.extra.mult > 0 then
            card.ability.extra.mult = 0
            return {
                message = localize('k_reset'),
                colour = G.C.RED
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

return { name = { "Jokers" }, items = { shredded_joker } }
