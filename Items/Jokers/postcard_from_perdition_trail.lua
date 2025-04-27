local postcard_from_perdition_trail = {
    object_type = "Joker",
    order = 203,
    ignore = true,

    key = "postcard_from_perdition_trail",
    config = {
      
    },
    rarity = 1,
    pos = { x = 17, y = 7},
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
return { name = {"Jokers"}, items = {postcard_from_perdition_trail} }
