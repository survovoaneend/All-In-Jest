local bad_guy = {
    object_type = "Joker",
    order = 368,
    ignore = true,
    key = "bad_guy",
    config = {
    },
    rarity = 1,
    pos = { x = 1, y = 20},
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
return { name = {"Jokers"}, items = {bad_guy} }
