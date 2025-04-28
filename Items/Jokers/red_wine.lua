local red_wine = {
    object_type = "Joker",
    order = 104,
    ignore = true,

    key = "red_wine",
    config = {
      
    },
    rarity = 1,
    pos = { x = 24, y = 3 },
    atlas = 'joker_atlas',
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
return { name = {"Jokers"}, items = {red_wine} }
