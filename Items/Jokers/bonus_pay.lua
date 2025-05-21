local bonus_pay = {
    object_type = "Joker",
    order = 307,
    ignore = true,
    key = "bonus_pay",
    config = {
    },
    rarity = 1,
    pos = { x = 4, y = 12},
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
return { name = {"Jokers"}, items = {bonus_pay} }
