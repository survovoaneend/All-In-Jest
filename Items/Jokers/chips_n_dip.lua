local chips_n_dip = {
    object_type = "Joker",
    order = 297,
    ignore = true,
    key = "chips_n_dip",
    config = {
      
    },
    rarity = 1,
    pos = { x = 19, y = 11},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xchips = 3
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {chips_n_dip} }
