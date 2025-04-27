local big_red = {
    object_type = "Joker",
    order = 130,
    ignore = true,

    key = "big_red",
    config = {
      
    },
    rarity = 1,
    pos = { x = 24, y = 4 },
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
return { name = {"Jokers"}, items = {big_red} }
