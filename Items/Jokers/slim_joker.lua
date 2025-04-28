local slim_joker = {
    object_type = "Joker",
    order = 51,
    ignore = true,

    key = "slim_joker",
    config = {
      
    },
    rarity = 1,
    pos = { x = 22, y = 1 },
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
return { name = {"Jokers"}, items = {slim_joker} }
