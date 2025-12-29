local historian = {
    object_type = "Joker",
    order = 409,
    key = "historian",
    config = {
        extra = {
            mult = 3
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
        local sell_cost = 0
        if G.GAME and G.GAME.all_in_jest and G.GAME.all_in_jest.previously_sold_jokers then
            local other_joker = G.GAME.all_in_jest.previously_sold_jokers[#G.GAME.all_in_jest.previously_sold_jokers]
            sell_cost = other_joker.sell_cost
        end
        return {
            vars = {
                card.ability.extra.mult,
                sell_cost * card.ability.extra.mult
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then 
            local mult = 0
            if G.GAME and G.GAME.all_in_jest and G.GAME.all_in_jest.previously_sold_jokers then
                local other_joker = G.GAME.all_in_jest.previously_sold_jokers[#G.GAME.all_in_jest.previously_sold_jokers]
                mult = card.ability.extra.mult * other_joker.sell_cost
            end
            return {
                mult = mult
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {historian} }