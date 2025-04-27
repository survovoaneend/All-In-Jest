local rising_sun = {
    object_type = "Joker",
    order = 124,
    ignore = true,

    key = "rising_sun",
    config = {
      
    },
    rarity = 1,
    pos = { x = 18, y = 4 },
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
return { name = {"Jokers"}, items = {rising_sun} }
