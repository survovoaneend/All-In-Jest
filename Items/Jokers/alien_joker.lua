local alien_joker = {
    object_type = "Joker",
    order = 338,
    ignore = true,
    key = "alien_joker",
    config = {
    },
    rarity = 1,
    pos = { x = 9, y = 13},
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
return { name = {"Jokers"}, items = {alien_joker} }
