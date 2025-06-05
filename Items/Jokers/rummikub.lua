local rummikub = {
    object_type = "Joker",
    order = 17,
    ignore = true,

    key = "rummikub",
    config = {
      
    },
    rarity = 1,
    pos = { x = 16, y = 0 },
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
return { name = {"Jokers"}, items = {rummikub} }
