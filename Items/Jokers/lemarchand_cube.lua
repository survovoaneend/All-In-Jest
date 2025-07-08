local lemarchand_cube = {
    object_type = "Joker",
    order = 345,
    ignore = true,
    key = "lemarchand_cube",
    config = {
    },
    rarity = 1,
    pos = { x = 16, y = 13},
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
return { name = {"Jokers"}, items = {lemarchand_cube} }
