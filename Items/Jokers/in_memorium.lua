local in_memorium = {
    object_type = "Joker",
    order = 490,
    key = "in_memorium",
    config = {
        extra = {
            xmult = 1,
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
                card.ability.extra.xmult,
            }
        }
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
            if card.ability.extra.xmult > 1 then
                return {
                    xmult = card.ability.extra.xmult,
                }
            end
        end
        if context.starting_shop and not card.ability.extra.triggered then
            G.E_MANAGER:add_event(Event ({
                trigger = 'before',
                func = function()
                    local c = G.shop_booster:remove_card(G.shop_booster.cards[1])
                    c:remove()
                    c = nil
                    local new_shop_card = Card(G.shop_booster.T.x + G.shop_booster.T.w/2,
                    G.shop_booster.T.y, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[get_pack('in_memorium', 'Spectral').key], {bypass_discovery_center = true, bypass_discovery_ui = true})
                    create_shop_card_ui(new_shop_card, 'Booster', G.shop_booster)
                    G.shop_booster:emplace(new_shop_card)
                    new_shop_card:juice_up()
                    return true
                end 
            }))
            card.ability.extra.triggered = true
        end
    end
}
return { name = { "Jokers" }, items = { in_memorium } }
