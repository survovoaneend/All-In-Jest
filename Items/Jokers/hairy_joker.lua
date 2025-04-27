local hairy_joker = {
    object_type = "Joker",
    order = 82,
    ignore = true,

    key = "hairy_joker",
    config = {
      
    },
    rarity = 1,
    pos = { x = 2, y = 3 },
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
return { name = {"Jokers"}, items = {hairy_joker} }
