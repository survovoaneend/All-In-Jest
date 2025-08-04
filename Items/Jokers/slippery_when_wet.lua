local slippery_when_wet = {
    object_type = "Joker",
    order = 24,
    ignore = true,

    key = "slippery_when_wet",
    config = {
      
    },
    rarity = 1,
    pos = { x = 22, y = 0 },
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
return { name = {"Jokers"}, items = {slippery_when_wet} }
