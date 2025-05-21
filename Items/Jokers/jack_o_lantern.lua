local jack_o_lantern = {
    object_type = "Joker",
    order = 312,
    ignore = true,
    key = "jack_o_lantern",
    config = {
    },
    rarity = 1,
    pos = { x = 9, y = 12},
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
return { name = {"Jokers"}, items = {jack_o_lantern} }
