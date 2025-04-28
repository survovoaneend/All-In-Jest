local clay_joker = {
    object_type = "Joker",
    order = 102,
    ignore = true,

    key = "clay_joker",
    config = {
      
    },
    rarity = 1,
    pos = { x = 22, y = 3 },
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
return { name = {"Jokers"}, items = {clay_joker} }
