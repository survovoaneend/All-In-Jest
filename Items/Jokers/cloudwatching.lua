local cloudwatching = {
    object_type = "Joker",
    order = 80,
    ignore = true,

    key = "cloudwatching",
    config = {
      
    },
    rarity = 1,
    pos = { x = 0, y = 3 },
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
return { name = {"Jokers"}, items = {cloudwatching} }
