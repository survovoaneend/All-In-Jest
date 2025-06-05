local enraging_photo = {
    object_type = "Joker",
    order = 190,
    ignore = true,

    key = "enraging_photo",
    config = {
      
    },
    rarity = 1,
    pos = { x = 4, y = 7},
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
return { name = {"Jokers"}, items = {enraging_photo} }
