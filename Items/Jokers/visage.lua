local visage = {
    object_type = "Joker",
    order = 232,
    ignore = true,
    key = "visage",
    config = {
    },
    rarity = 2,
    pos = { x = 21, y = 8 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
        
    end

}

return { name = { "Jokers" }, items = { visage } }
