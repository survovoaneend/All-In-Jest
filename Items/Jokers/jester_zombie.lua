local jester_zombie = {
    object_type = "Joker",
    order = 236,
    ignore = true,
    key = "jester_zombie",
    config = {
      
    },
    rarity = 1,
    pos = { x = 4, y = 9},
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
return { name = {"Jokers"}, items = {jester_zombie} }
