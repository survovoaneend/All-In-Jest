local cairoli = {
    object_type = "Joker",
    order = 1076,
    key = "cairoli",
    config = {
       extra = {
        xmult = 1,
        gain = 0.5
       }
    },
    rarity = 4,
    pos = { x = 2, y = 14 },
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 2, y = 15 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gain, card.ability.extra.xmult } }
    end,

    calculate = function(self, card, context)
        if (context.skip_blind or context.skipping_booster) and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
                colour = G.C.MULT
            }
        end
        if context.joker_main then
            return {
                x_mult = card.ability.extra.xmult
            }
        end
    end,
}
return { name = { "Jokers" }, items = { cairoli } }