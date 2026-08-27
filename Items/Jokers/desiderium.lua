local desiderium = {
    object_type = "Joker",
    order = 598,
    key = "desiderium",
  
    config = {
        extra = {
            xmult_mod = 0.5,
            xmult = 1,
            trigger = false,
        }
    },
    attributes = { 'xmult', 'scaling', 'shop' },
    rarity = 2,
    pos = { x = 9, y = 27 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    pixel_size = { w = 71, h = 76 },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_mod,
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.starting_shop and not context.blueprint then
            card.ability.extra.trigger = true
        end
        if context.money_altered and to_big(context.amount) < to_big(0) and not context.blueprint then
            card.ability.extra.trigger = false
        end
        if context.ending_shop and not context.blueprint and card.ability.extra.trigger then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_mod"
            })
            return nil, true
        end
        if context.joker_main then
            return {
               xmult = card.ability.extra.xmult
            }
        end
    end
}
return { name = { "Jokers" }, items = { desiderium } }