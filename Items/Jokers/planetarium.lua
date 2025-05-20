local planetarium = {
    object_type = "Joker",
    order = 314,
    ignore = true,
    key = "planetarium",
    config = {
    },
    rarity = 1,
    pos = { x = 11, y = 12},
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
return { name = {"Jokers"}, items = {planetarium} }
