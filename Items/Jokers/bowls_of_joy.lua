local bowls_of_joy = {
    object_type = "Joker",
    order = 296,

    key = "bowls_of_joy",
    config = {
        extra = {
            chance = 4
        }
    },
    rarity = 2,
    pos = { x = 18, y = 11 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.chance, 'bowls_of_joy')
        return { vars = { numerator, denominator } }

    end,

    calculate = function(self, card, context)
        if context.reroll_shop and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'bowls_of_joy', 1, card.ability.extra.chance) then
                card.ability.extra_value = card.ability.extra_value + context.cost
                card:set_cost()
                return {
                    message = localize('k_val_up'),
                    colour = G.C.MONEY
                }
            end
        end
    end

}
return { name = { "Jokers" }, items = { bowls_of_joy } }
