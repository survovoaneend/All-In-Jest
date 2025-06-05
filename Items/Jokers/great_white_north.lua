local great_white_north = {
    object_type = "Joker",
    order = 65,
    ignore = true,

    key = "great_white_north",
    config = {
      
    },
    rarity = 1,
    pos = { x = 11, y = 2 },
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
return { name = {"Jokers"}, items = {great_white_north} }
