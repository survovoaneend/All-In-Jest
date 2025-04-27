local lost_carcosa = {
    object_type = "Joker",
    order = 201,
    ignore = true,

    key = "lost_carcosa",
    config = {
      
    },
    rarity = 1,
    pos = { x = 16, y = 7},
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
return { name = {"Jokers"}, items = {lost_carcosa} }
