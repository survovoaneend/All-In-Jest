local bad_sun = {
    object_type = "Joker",
    order = 344,
    ignore = true,
    key = "bad_sun",
    config = {
    },
    rarity = 1,
    pos = { x = 15, y = 13},
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
return { name = {"Jokers"}, items = {bad_sun} }
