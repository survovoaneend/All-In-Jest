local greasepaint = {
    object_type = "Joker",
    order = 29,
    ignore = true,

    key = "greasepaint",
    config = {
      
    },
    rarity = 1,
    pos = { x = 2, y = 1 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {greasepaint} }
