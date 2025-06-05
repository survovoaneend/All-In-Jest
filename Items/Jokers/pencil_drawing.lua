local pencil_drawing = {
    object_type = "Joker",
    order = 63,
    ignore = true,

    key = "pencil_drawing",
    config = {
      
    },
    rarity = 1,
    pos = { x = 9, y = 2 },
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
return { name = {"Jokers"}, items = {pencil_drawing} }
