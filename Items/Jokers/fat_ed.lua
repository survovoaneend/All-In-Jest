local fat_ed = {
    object_type = "Joker",
    order = 227,
    ignore = true,

    key = "fat_ed",
    config = {
      
    },
    rarity = 1,
    pos = { x = 16, y = 8},
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
return { name = {"Jokers"}, items = {fat_ed} }
