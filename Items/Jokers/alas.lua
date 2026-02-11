local alas = {
    object_type = "Joker",
    order = 441,
    key = "alas",

    config = {
        extra = {
            chips = 0,
            chip_gain = 1
        }
    },
    rarity = 1,
    pos = { x = 11, y = 22 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

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
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
            return {
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chip_gain } },
                colour = G.C.CHIPS,
                delay = 0.2
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

return { name = { "Jokers" }, items = { alas } }
