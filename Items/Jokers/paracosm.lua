local paracosm = {
    object_type = "Joker",
    order = 288,
    ignore = true,
    key = "paracosm",
    config = {
      
    },
    rarity = 1,
    pos = { x = 11, y = 11},
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
return { name = {"Jokers"}, items = {paracosm} }
