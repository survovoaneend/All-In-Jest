local killigrew = {
    object_type = "Joker",
    order = 276,
    ignore = true,

    key = "killigrew",
    config = {
      
    },
    rarity = 4,
		unlock_condition = {hidden = true},
    pos = { x = 0, y = 6},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 0, y = 7},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {killigrew} }
