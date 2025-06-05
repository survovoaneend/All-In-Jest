local skomorokh = {
    object_type = "Joker",
    order = 209,
    ignore = true,

    key = "skomorokh",
    config = {
      
    },
    rarity = 1,
    pos = { x = 23, y = 7},
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
return { name = {"Jokers"}, items = {skomorokh} }
