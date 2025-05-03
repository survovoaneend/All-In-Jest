local nybbas = {
    object_type = "Joker",
    order = 246,
    ignore = true,

    key = "nybbas",
    config = {
      
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 0, y = 0},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 0, y = 1},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {nybbas} }
