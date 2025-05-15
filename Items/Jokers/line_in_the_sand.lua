local line_in_the_sand = {
    object_type = "Joker",
    order = 81,
    
    key = "line_in_the_sand",
    config = {
      
    },
    rarity = 2,
    pos = { x = 1, y = 3 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
}
return { name = {"Jokers"}, items = {line_in_the_sand} }
