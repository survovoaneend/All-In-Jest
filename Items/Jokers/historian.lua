local historian = {
    object_type = "Joker",
    order = 409,
    key = "historian",
    config = {
        extra = {
            mult = 0
        }
    },
    rarity = 1,
    pos = { x = 24, y = 14},
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.mult
                }
            }
    end,
  
    calculate = function(self, card, context)
        if G.all_in_jest_visage_last_sold and G.all_in_jest_visage_last_sold.cards[1] then
            local other_joker = G.all_in_jest_visage_last_sold.cards[1]
            card.ability.extra.mult = 3 * other_joker.sell_cost
        end
        if context.joker_main then 
            return {
                mult = card.ability.extra.mult
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {historian} }