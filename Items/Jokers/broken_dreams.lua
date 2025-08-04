local broken_dreams = {
    object_type = "Joker",
    order = 340,
    ignore = true,
    key = "broken_dreams",
    config = {
    },
    rarity = 1,
    pos = { x = 11, y = 13},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
        
    end
  
}
return { name = {"Jokers"}, items = {broken_dreams} }
