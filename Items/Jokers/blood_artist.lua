local blood_artist = {
    object_type = "Joker",
    order = 86,
    ignore = true,

    key = "blood_artist",
    config = {
      
    },
    rarity = 1,
    pos = { x = 6, y = 3 },
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
return { name = {"Jokers"}, items = {blood_artist} }
