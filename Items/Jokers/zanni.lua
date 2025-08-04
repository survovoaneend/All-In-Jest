local zanni = {
    object_type = "Joker",
    order = 90,
    ignore = true,

    key = "zanni",
    config = {
      
    },
    rarity = 1,
    pos = { x = 10, y = 3 },
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
return { name = {"Jokers"}, items = {zanni} }
