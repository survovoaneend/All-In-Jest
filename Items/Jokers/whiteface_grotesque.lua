local whiteface_grotesque = {
    object_type = "Joker",
    order = 8,
    ignore = true,

    key = "whiteface_grotesque",
    config = {
      
    },
    rarity = 1,
    pos = { x = 7, y = 0 },
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
return { name = {"Jokers"}, items = {whiteface_grotesque} }
