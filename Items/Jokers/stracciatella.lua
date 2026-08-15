local stracciatella = {
    object_type = "Joker",
    order = 855,
    ignore = true,
    key = "stracciatella",
    config = {
        extra = {
            dollars = 10
        }
    },
    attributes = {},
    rarity = 2,
    pos = { x = 2, y = 40},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return { }
    end,

    calculate = function(self, card, context)
        
    end,
    
}
return { name = {"Jokers"}, items = {stracciatella} }