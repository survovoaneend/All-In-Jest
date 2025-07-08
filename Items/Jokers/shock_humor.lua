local shock_humor = {
    object_type = "Joker",
    order = 354,
    ignore = true,
    key = "shock_humor",
    config = {
    },
    rarity = 1,
    pos = { x = 0, y = 14},
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
return { name = {"Jokers"}, items = {shock_humor} }
