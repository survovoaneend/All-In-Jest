local bingo_card = {
    object_type = "Joker",
    order = 300,
    ignore = true,
    key = "bingo_card",
    config = {
      
    },
    rarity = 1,
    pos = { x = 22, y = 11},
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
return { name = {"Jokers"}, items = {bingo_card} }
