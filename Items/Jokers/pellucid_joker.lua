local pellucid_joker = {
    object_type = "Joker",
    order = 142,
    ignore = true,

    key = "pellucid_joker",
    config = {
      
    },
    rarity = 1,
    pos = { x = 11, y = 5 },
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
return { name = {"Jokers"}, items = {pellucid_joker} }
