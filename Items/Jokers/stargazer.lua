local stargazer = {
    object_type = "Joker",
    order = 315,
    ignore = true,
    key = "stargazer",
    config = {
    },
    rarity = 1,

    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
        
    end
  
}
return { name = {"Jokers"}, items = {stargazer} }
