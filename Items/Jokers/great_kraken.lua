local great_kraken = {
    object_type = "Joker",
    order = 219,
    ignore = true,

    key = "great_kraken",
    config = {
      
    },
    rarity = 1,
    pos = { x = 8, y = 8},
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
return { name = {"Jokers"}, items = {great_kraken} }
