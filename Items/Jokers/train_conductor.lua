local train_conductor = {
    object_type = "Joker",
    order = 879,

    key = "train_conductor",
    config = {
        extra = {
            xmult_to_mult = 500,
            mult_to_xmult = 15,
            xmult_effect_table = {
                ['x_mult'] = true,
                ['xmult'] = true,
                ['Xmult'] = true,
            },
            mult_effect_table = {
                ['mult'] = true,
            }
        }
    },
    attributes = { 'xmult', 'mult', 'multiplier' },
    rarity = 2,
    pos = { x = 0, y = 41},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.mult_to_xmult,
                card.ability.extra.xmult_to_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.aij_modify_card_effects and context.card and context.card.config.center.set == 'Joker' and not context.from_edition and not context.blueprint then
            if (context.effect_type == 'mult' or context.effect_type == 'h_mult' or context.effect_type == 'mult_mod') and context.amount and context.amount > 0 then
                if context.effects.card and context.effects.card ~= context.card then juice_card(context.effects.card) end
                local amount = math.max(1.2, (context.amount * (card.ability.extra.mult_to_xmult/100)))
                context.parameter:modify(mult * (amount - 1))
                context.effects.message = nil
                card_eval_status_text(context.effects.message_card or context.effects.juice_card or context.card or context.effects.card or context.effects.focus, 'x_mult', amount, percent)
                return {
                    override = true
                }
            end
            if (context.effect_type == 'x_mult' or context.effect_type == 'xmult' or context.effect_type == 'Xmult' or context.effect_type == 'x_mult_mod' or context.effect_type == 'Xmult_mod') and context.amount > 1 and math.floor(context.amount * (card.ability.extra.xmult_to_mult/100)) >= 1 then
                if context.effects.card and context.effects.card ~= context.card then juice_card(context.effects.card) end
                local amount = math.floor(context.amount * (card.ability.extra.xmult_to_mult/100))
                context.parameter:modify(amount)
                context.effects.message = nil
                card_eval_status_text(context.effects.message_card or context.effects.juice_card or context.card or context.effects.card or context.effects.focus, 'mult', amount, percent)
                return {
                    override = true
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {train_conductor} }