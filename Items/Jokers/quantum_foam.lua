local quantum_foam = {
    object_type = "Joker",
    order = 586,
    key = "quantum_foam",
  
    config = {
        extra = {
            odds = 2
        }
    },
    rarity = 1,
    pos = { x = 24, y = 27 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'quantum_foam')
        return {
            vars = {
                numerator,
                denominator
            }
        }
    end,

    calculate = function(self, card, context)
         if context.repetition and context.cardarea == G.play then
            if context.other_card.config.center == G.P_CENTERS.c_base and SMODS.pseudorandom_probability(card, 'quantum', 1, card.ability.extra.odds) then
                return {
                    repetitions = 1,
                }
            end
        end
    end
}


return { name = { "Jokers" }, items = { quantum_foam } }