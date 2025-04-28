local columbina = {
    object_type = "Joker",
    order = 116,
    ignore = true,

    key = "columbina",
    config = {
      
    },
    rarity = 1,
    pos = { x = 11, y = 4 },
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
return { name = {"Jokers"}, items = {columbina} }
