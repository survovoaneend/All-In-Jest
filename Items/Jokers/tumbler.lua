local tumbler = {
    object_type = "Joker",
    order = 113,
    ignore = true,

    key = "tumbler",
    config = {
      
    },
    rarity = 1,
    pos = { x = 8, y = 4 },
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
return { name = {"Jokers"}, items = {tumbler} }
