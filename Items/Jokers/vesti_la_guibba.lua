local vesti_la_guibba = {
    object_type = "Joker",
    order = 119,
    ignore = true,

    key = "vesti_la_guibba",
    config = {
      
    },
    rarity = 1,
    pos = { x = 14, y = 4 },
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
return { name = {"Jokers"}, items = {vesti_la_guibba} }
