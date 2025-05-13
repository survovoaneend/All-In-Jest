local bluet = {
    object_type = "Joker",
    order = 1041,
     ignore = true,
    key = "bluet",
    config = {
      
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 0, y = 8},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 0, y = 9},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.setting_blind then
        create_consumable("Spectral", nil, nil, {edition = "e_negative"})
      end
    end
  
}
return { name = {"Jokers"}, items = {bluet} }
