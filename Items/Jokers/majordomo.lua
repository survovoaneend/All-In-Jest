local majordomo = {
    object_type = "Joker",
    order = 352,
    ignore = true,
    key = "majordomo",
    config = {
    },
    rarity = 1,
    pos = { x = 23, y = 13},
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
return { name = {"Jokers"}, items = {majordomo} }
