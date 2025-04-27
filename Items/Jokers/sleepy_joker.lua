local sleepy_joker = {
    object_type = "Joker",
    order = 5,
    ignore = true,

    key = "sleepy_joker",
    config = {
      
    },
    rarity = 1,
    pos = { x = 6, y = 0 },
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
return { name = {"Jokers"}, items = {sleepy_joker} }
