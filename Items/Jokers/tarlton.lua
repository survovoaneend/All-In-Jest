local tarlton = {
    object_type = "Joker",
    order = 1027,
    

    key = "tarlton",
    config = {
      extra = {
        last_chips = 0,
      }
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 6, y = 4},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 6, y = 5},
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.last_chips
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.final_scoring_step and context.cardarea == G.jokers then
            card.ability.extra.last_chips = hand_chips
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.last_chips,
            }
        end
        if context.end_of_round then
            card.ability.extra.last_chips = 0
        end
    end
  
}
return { name = {"Jokers"}, items = {tarlton} }
