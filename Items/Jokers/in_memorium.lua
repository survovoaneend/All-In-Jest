local in_memorium = {
    object_type = "Joker",
    order = 490,
    key = "in_memorium",
    config = {
        extra = {
            xmult = 0,
            xmult_mod = 0.1,
            triggered = false
        }
    },
    rarity = 1,
    pos = { x = 6, y = 24 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_mod,
                card.ability.extra.xmult + 1,
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
            -- Gives synergy to Pellesini and similar effects
            card.ability.extra.triggered = false
        end
    end,

    calculate = function(self, card, context)
        if context.open_booster and not context.blueprint and context.card.config.center.kind == 'Spectral' then
            SMODS.scale_card(card, {
	            ref_table = card.ability.extra,
                ref_value = "xmult",
	            scalar_value = "xmult_mod",
            })
        end
        if context.joker_main then
            local mult = card.ability.extra.xmult + 1
            if mult > 1 then
                return {
                    xmult = mult,
                }
            end
        end
        if context.starting_shop and not card.ability.extra.triggered then
            G.E_MANAGER:add_event(Event ({
                trigger = 'before',
                func = function()
                    All_in_Jest.reroll_joker(G.shop_booster.cards[1], get_pack('in_memorium', 'Spectral').key, 'in_memorium', nil, {type = "Booster"})
                    return true
                end
            }))
            card.ability.extra.triggered = true
        end
    end
}
return { name = { "Jokers" }, items = { in_memorium } }
