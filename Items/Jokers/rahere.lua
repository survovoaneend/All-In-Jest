local rahere = {
    object_type = "Joker",
    order = 281,
    ignore = true,

    key = "rahere",
    config = {
      
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 5, y = 6},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 5, y = 7},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {rahere} }
