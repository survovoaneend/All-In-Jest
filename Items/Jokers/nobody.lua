local nobody = {
    object_type = "Joker",
    order = 339,
    ignore = true,
    key = "nobody",
    config = {
    },
    rarity = 1,
    pos = { x = 10, y = 13},
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
return { name = {"Jokers"}, items = {nobody} }
