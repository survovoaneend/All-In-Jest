local adoring_joker = {
    object_type = "Joker",
    order = 67,
    ignore = true,

    key = "adoring_joker",
    config = {
      
    },
    rarity = 1,
    pos = { x = 13, y = 2 },
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
return { name = {"Jokers"}, items = {adoring_joker} }
