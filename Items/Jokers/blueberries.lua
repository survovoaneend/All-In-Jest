local blueberries = {
    object_type = "Joker",
    order = 634.4,
    key = "blueberries",
  
    config = {
        extra = {
            xmult_minus_mod = 0.1,
            xmult_mod = 0.5,
            xmult = 0,
            enhancement = 'm_aij_fervent',
            tarot = 'c_aij_magus'
        }
    },
    attributes = { 'xmult', 'scaling', 'enhancements', 'food', 'generation', 'tarot', 'consumable' },
    rarity = 3,
    pos = { x = 18, y = 30 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,


    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS[card.ability.extra.tarot]
        return {
            vars = {
                card.ability.extra.xmult_mod,
                card.ability.extra.xmult_minus_mod,
                1+card.ability.extra.xmult,
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        if not from_debuff and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({ key = card.ability.extra.tarot, area = G.consumeables })
                    G.GAME.consumeable_buffer = 0
                    return true
                end
            }))
        end
    end,

    calculate = function(self, card, context)
        if context.setting_ability and not context.unchanged and not context.blueprint then
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
        if context.aij_retriggered_card and context.times > 0 and not context.blueprint then
            for i = 1, context.times do
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
return { name = { "Jokers" }, items = { blueberries } }