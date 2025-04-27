local silly_billy = {
    object_type = "Joker",
    order = 210,
    ignore = true,

    key = "silly_billy",
    config = {
      
    },
    rarity = 1,
    pos = { x = 24, y = 7},
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
return { name = {"Jokers"}, items = {silly_billy} }
