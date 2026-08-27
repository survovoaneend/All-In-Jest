local the_freezer = {
    object_type = "Joker",
    order = 326,
    ignore = true,
    key = "the_freezer",
    config = {
    },
    attributes = {},
    rarity = 1,
    pos = { x = 15, y = 12},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
        
    end
  
}
return { name = {"Jokers"}, items = {the_freezer} }
