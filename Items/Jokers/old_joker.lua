local old_joker = {
    object_type = "Joker",
    order = 21,
    ignore = true,

    key = "old_joker",
    config = {
      
    },
    rarity = 1,
    pos = { x = 19, y = 0 },
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
return { name = {"Jokers"}, items = {old_joker} }
