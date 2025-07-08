local clownbug = {
    object_type = "Joker",
    order = 356,
    ignore = true,
    key = "clownbug",
    config = {
    },
    rarity = 1,
    pos = { x = 2, y = 14},
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
return { name = {"Jokers"}, items = {clownbug} }
