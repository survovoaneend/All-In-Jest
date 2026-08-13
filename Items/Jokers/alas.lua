local alas = {
    object_type = "Joker",
    order = 460,
    key = "alas",

    config = {
        extra = {
            chips = 0,
            chip_gain = 1
        }
    },
    attributes = { 'chips', 'scaling', 'discard' },
    rarity = 1,
    pos = { x = 11, y = 22 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
               card.ability.extra.chip_gain,
               card.ability.extra.chips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.discard and not context.blueprint and not context.other_card.debuff then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "chips",
                scalar_value = "chip_gain",
                scaling_message = {
                    message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chip_gain } },
                    colour = G.C.CHIPS,
                    delay = 0.2
                }
            })
            return nil, true
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

return { name = { "Jokers" }, items = { alas } }
