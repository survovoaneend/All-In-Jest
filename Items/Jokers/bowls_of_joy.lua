local bowls_of_joy = {
    object_type = "Joker",
    order = 303,

    key = "bowls_of_joy",
    config = {
        extra = {
            chance = 4
        }
    },
    attributes = { 'sell_value', 'scaling', 'reroll', 'chance' },
    rarity = 2,
    pos = { x = 18, y = 11 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.chance, 'bowls_of_joy')
        return { vars = { numerator, denominator } }

    end,

    calculate = function(self, card, context)
        if context.reroll_shop and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'bowls_of_joy', 1, card.ability.extra.chance) then
                SMODS.scale_card(card, {
                    ref_table = card.ability,
                    ref_value = "extra_value",
                    scalar_table = {value = context.cost},
                    scalar_value = "value",
                    scaling_message = {
                        message = localize('k_val_up'),
                        colour = G.C.MONEY
                    },
                })
                card:set_cost()
                return nil, true
            end
        end
    end

}
return { name = { "Jokers" }, items = { bowls_of_joy } }
