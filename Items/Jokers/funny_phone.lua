local funny_phone = {
    object_type = "Joker",
    order = 261,

    key = "funny_phone",
    config = {
        extra = {
            chips = 0,
            chip_gain = 0,
            max = 10,
            min = 1,
        }
    },
    rarity = 1,
    pos = { x = 8, y = 10 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.max,
                card.ability.extra.min
            }
        }
    end,

    calculate = function(self, card, context)
        if context.reroll_shop and not context.blueprint then
            card.ability.extra.chip_gain = pseudorandom('funny_phone', card.ability.extra.min, card.ability.extra.max)
            return {
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chip_gain } },
                colour = G.C.CHIPS,
                func = function()
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "chips",
                        scalar_value = "chip_gain",
                        no_message = true
                    })
                end
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end

}
return { name = { "Jokers" }, items = { funny_phone } }
