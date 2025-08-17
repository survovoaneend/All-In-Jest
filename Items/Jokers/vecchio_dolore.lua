local vecchio_dolore = {
    object_type = "Joker",
    order = 366,
    ignore = true,
    key = "vecchio_dolore",
    config = {
    },
    rarity = 1,
    pos = { x = 24, y = 19},
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
return { name = {"Jokers"}, items = {vecchio_dolore} }
