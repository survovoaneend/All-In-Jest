local pengelding = {
    object_type = "Joker",
    order = 10015,

    key = "pengelding",
    config = {
        extra = {
            threshold = 10,
            xmult_gain = 0.25
        }
    },
    attributes = { },
    rarity = 4,
    unlock_condition = { hidden = true },
    pos = { x = 4, y = 16},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    soul_pos = { x = 4, y = 17},

    loc_vars = function(self, info_queue, card)
        local total_sell = 0
        if G.jokers and G.jokers.cards then
            for _, j in ipairs(G.jokers.cards) do
                total_sell = total_sell + (j.sell_cost or 0)
            end
        end
        local current_xmult = 1 + math.floor(total_sell / card.ability.extra.threshold) * card.ability.extra.xmult_gain
        return {
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.threshold,
                current_xmult
            }
        }
    end,

    
    calculate = function(self, card, context)
       if context.individual and context.cardarea == G.hand and not context.end_of_round then
            local total_sell = 0
            for _, j in ipairs(G.jokers.cards) do
                total_sell = total_sell + (j.sell_cost or 0)
            end

            local xmult_val = 1 + math.floor(total_sell / card.ability.extra.threshold) * card.ability.extra.xmult_gain

            if xmult_val > 1 then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED
                    }
                else
                    return {
                        x_mult = xmult_val
                    }
                end
            end
        end
    end
}
return { name = {"Jokers"}, items = {pengelding} }