local comedians_manifesto = {
    object_type = "Joker",
    order = 33,
    ignore = true,

    key = "comedians_manifesto",
    config = {
      
    },
    rarity = 1,
    pos = { x = 6, y = 1 },
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
return { name = {"Jokers"}, items = {comedians_manifesto} }
