local memory_card = {
    object_type = "Joker",
    order = 4,
    ignore = true,

    key = "memory_card",
    config = {
      
    },
    rarity = 3,
    pos = { x = 3, y = 0 },
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
return { name = {"Jokers"}, items = {memory_card} }
