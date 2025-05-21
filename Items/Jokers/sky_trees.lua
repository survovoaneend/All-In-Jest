local sky_trees = {
    object_type = "Joker",
    order = 318,
    ignore = true,
    key = "sky_trees",
    config = {
    },
    rarity = 1,
    pos = { x = 14, y = 12},
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
return { name = {"Jokers"}, items = {sky_trees} }
