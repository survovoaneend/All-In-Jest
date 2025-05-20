local illuminated_joker = {
    object_type = "Joker",
    order = 308,
    ignore = true,
    key = "illuminated_joker",
    config = {
    },
    rarity = 1,
    pos = { x = 5, y = 12},
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
return { name = {"Jokers"}, items = {illuminated_joker} }
