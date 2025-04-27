local bearded_joker = {
    object_type = "Joker",
    order = 208,
    ignore = true,

    key = "bearded_joker",
    config = {
      
    },
    rarity = 1,
    pos = { x = 22, y = 7},
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
return { name = {"Jokers"}, items = {bearded_joker} }
