local diogenes = {
    object_type = "Joker",
    order = 31,
    ignore = true,

    key = "diogenes",
    config = {
      
    },
    rarity = 1,
    pos = { x = 4, y = 1 },
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
return { name = {"Jokers"}, items = {diogenes} }
