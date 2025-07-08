local sherrif = {
    object_type = "Joker",
    order = 337,
    ignore = true,
    key = "sherrif",
    config = {
    },
    rarity = 1,
    pos = { x = 8, y = 13},
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
return { name = {"Jokers"}, items = {sherrif} }
