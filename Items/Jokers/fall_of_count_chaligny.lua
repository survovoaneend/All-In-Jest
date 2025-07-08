local fall_of_count_chaligny = {
    object_type = "Joker",
    order = 342,
    ignore = true,
    key = "fall_of_count_chaligny",
    config = {
    },
    rarity = 1,
    pos = { x = 13, y = 13},
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
return { name = {"Jokers"}, items = {fall_of_count_chaligny} }
