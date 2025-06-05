local lucky_carder = {
    object_type = "Joker",
    order = 97,
    ignore = true,

    key = "lucky_carder",
    config = {
      
    },
    rarity = 1,
    pos = { x = 17, y = 3 },
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
return { name = {"Jokers"}, items = {lucky_carder} }
