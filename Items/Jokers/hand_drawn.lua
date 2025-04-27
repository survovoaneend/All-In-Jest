local hand_drawn = {
    object_type = "Joker",
    order = 76,
    ignore = true,

    key = "hand_drawn",
    config = {
      
    },
    rarity = 1,
    pos = { x = 21, y = 2 },
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
return { name = {"Jokers"}, items = {hand_drawn} }
