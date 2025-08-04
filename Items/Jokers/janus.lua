local janus = {
    object_type = "Joker",
    order = 133,
    ignore = true,

    key = "janus",
    config = {
      
    },
    rarity = 1,
    pos = { x = 2, y = 5 },
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
return { name = {"Jokers"}, items = {janus} }
