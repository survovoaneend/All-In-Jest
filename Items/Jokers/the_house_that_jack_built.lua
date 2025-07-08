local the_house_that_jack_built = {
    object_type = "Joker",
    order = 355,
    ignore = true,
    key = "the_house_that_jack_built",
    config = {
    },
    rarity = 1,
    pos = { x = 1, y = 14},
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
return { name = {"Jokers"}, items = {the_house_that_jack_built} }
