local magic_hat = {
    object_type = "Joker",
    order = 192,
    ignore = true,

    key = "magic_hat",
    config = {
      
    },
    rarity = 1,
    pos = { x = 6, y = 7},
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
return { name = {"Jokers"}, items = {magic_hat} }
