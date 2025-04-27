local hat_trick = {
    object_type = "Joker",
    order = 12,
    ignore = true,

    key = "hat_trick",
    config = {
      
    },
    rarity = 1,
    pos = { x = 11, y = 0 },
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
return { name = {"Jokers"}, items = {hat_trick} }
