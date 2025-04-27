local buzheninova = {
    object_type = "Joker",
    order = 290,
    ignore = true,

    key = "buzheninova",
    config = {
      
    },
    rarity = 4,
		unlock_condition = {hidden = true},
    pos = { x = 4, y = 8},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 4, y = 9},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {buzheninova} }
