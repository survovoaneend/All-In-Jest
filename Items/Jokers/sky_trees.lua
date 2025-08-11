local sky_trees = {
    object_type = "Joker",
    order = 318,
    key = "sky_trees",
    config = {
    },
    rarity = 2,
    pos = { x = 14, y = 12},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
        
    end
  
}
return { name = {"Jokers"}, items = {sky_trees} }
