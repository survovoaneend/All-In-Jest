local guillaume = {
    object_type = "Joker",
    order = 271,
    ignore = true,

    key = "guillaume",
    config = {
      
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 5, y = 4},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 5, y = 5},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {guillaume} }
