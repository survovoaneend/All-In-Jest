local dapper_dan = {
    object_type = "Joker",
    order = 149,
    ignore = true,

    key = "dapper_dan",
    config = {
      
    },
    rarity = 1,
    pos = { x = 18, y = 5 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
  end,
}
return { name = {"Jokers"}, items = {dapper_dan} }

