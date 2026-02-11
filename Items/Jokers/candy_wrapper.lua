local candy_wrapper = {
    object_type = "Joker",
    order = 391,
    key = "candy_wrapper",
    
    config = {
        extra = {
            mult_per_dollar = 4
        }
    },
    rarity = 1,
    pos = { x = 6, y = 16 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local total_val = 0
        if G.consumeables and G.consumeables.cards then
            for _, v in ipairs(G.consumeables.cards) do
                total_val = total_val + v.sell_cost
            end
        end
        return {
            vars = {
                card.ability.extra.mult_per_dollar,
                total_val * card.ability.extra.mult_per_dollar
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local total_val = 0
            
            -- Sum sell cost of all held consumables
            if G.consumeables and G.consumeables.cards then
                for _, v in ipairs(G.consumeables.cards) do
                    total_val = total_val + v.sell_cost
                end
            end
            
            if total_val > 0 then
                return {
                    mult = total_val * card.ability.extra.mult_per_dollar
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { candy_wrapper } }
