local a_young_hamlet = {
    object_type = "Joker",
    order = 362,

    key = "a_young_hamlet",
    config = {
        extra = {
            mult = 0,
            mult_mod = 1,
            discards = 6,
            discards_remaining = 6,
        }
    },
    rarity = 1,
    pos = { x = 20, y = 19 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.mult_mod,
                card.ability.extra.discards,
                card.ability.extra.discards_remaining,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.discard and not context.blueprint then
            if card.ability.extra.discards_remaining <= 1 then
                card.ability.extra.discards_remaining = card.ability.extra.discards
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_value = "mult_mod",
                })
            else
                card.ability.extra.discards_remaining = card.ability.extra.discards_remaining - 1
                return nil, true
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end

}
return { name = { "Jokers" }, items = { a_young_hamlet } }
