local the_grim_joker = {
    object_type = "Joker",
    order = 321,
    ignore = true,
    key = "the_grim_joker",
    config = {
    },
    rarity = 1,
    pos = { x = 17, y = 12},
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
return { name = {"Jokers"}, items = {the_grim_joker} }
