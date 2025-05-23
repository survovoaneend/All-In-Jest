local prank_caller = {
    object_type = "Joker",
    order = 324,
    ignore = true,
    key = "prank_caller",
    config = {
    },
    rarity = 1,
    pos = { x = 20, y = 12},
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
return { name = {"Jokers"}, items = {prank_caller} }
