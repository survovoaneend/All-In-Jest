local blind_drawn = {
    object_type = "Joker",
    order = 126,
    ignore = true,

    key = "blind_drawn",
    config = {
      
    },
    rarity = 1,
    pos = { x = 20, y = 4 },
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
return { name = {"Jokers"}, items = {blind_drawn} }
