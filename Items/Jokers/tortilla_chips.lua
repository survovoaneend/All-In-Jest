local tortilla_chips = {
    object_type = "Joker",
    order = 628,
    key = "tortilla_chips",
  
    config = {
        extra = {
            xmult_minus_mod = 0.05,
            xmult_mod = 0.25,
            xmult = 0.25,
            enhancement = 'm_bonus'
        }
    },
    attributes = { 'xmult', 'scaling', 'enhancements', 'food' },
    rarity = 3,
    pos = { x = 19, y = 34 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,


    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_mod,
                card.ability.extra.xmult_minus_mod,
                1+card.ability.extra.xmult,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_ability and not context.unchanged and not context.blueprint then
            if card.config.center.set == 'Joker' then return end
            local enhancements = get_current_pool("Enhanced")
            local can_proceed = false
            for k, v in pairs(enhancements) do
                if (context.old == 'c_base' or context.old == v) and context.new == card.ability.extra.enhancement then 
                    can_proceed = true
                end
            end
            if can_proceed then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xmult",
                    scalar_value = "xmult_mod"
                })
            end
        end
        if context.final_scoring_step and context.cardarea == G.jokers and not context.blueprint then
            if hand_chips > mult then
                if ((1+card.ability.extra.xmult) - card.ability.extra.xmult_minus_mod) <= 1 then
                    SMODS.destroy_cards(card, nil, nil, true)
                    return {
                        message = localize('k_eaten_ex'),
                    }
                else
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "xmult",
                        scalar_value = "xmult_minus_mod",
                        operation = '-',
                        message_key = 'a_xmult_minus'
                    })
                end
            end
        end
        if context.joker_main then
            return {
                xmult = 1 + card.ability.extra.xmult,
            }
        end
    end
}


return { name = { "Jokers" }, items = { tortilla_chips } }