local circuit_board = {
    object_type = "Joker",
    order = 34,
    ignore = true,

    key = "circuit_board",
    config = {
      
    },
    rarity = 1,
    pos = { x = 7, y = 1 },
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
return { name = {"Jokers"}, items = {circuit_board} }
