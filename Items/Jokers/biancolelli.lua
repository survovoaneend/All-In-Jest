local biancolelli = {
    object_type = "Joker",
    order = 1010,

    key = "biancolelli",
    config = {
      
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 9, y = 0},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 9, y = 1},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.final_scoring_step then
        return {
            balance = true
        }
      end
    end
  
}
return { name = {"Jokers"}, items = {biancolelli} }
