local archy = {
    object_type = "Joker",
    order = 266,
    ignore = true,

    key = "archy",
    config = {
      
    },
    rarity = 4,
		unlock_condition = {hidden = true},
    pos = { x = 0, y = 4},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 0, y = 5},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {archy} }
