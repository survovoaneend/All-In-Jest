local sommers = {
    object_type = "Joker",
    order = 1022,

    key = "sommers",
    config = {
      extra = {
        levels = 2
      }
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 1, y = 4},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 1, y = 5},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.before and context.main_eval then
            return {
                level_up = true,
                message = localize('k_level_up_ex')
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {sommers} }
