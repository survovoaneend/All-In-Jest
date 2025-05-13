local angoulevent = {
    object_type = "Joker",
    order = 1039,
    ignore = true,
    key = "angoulevent",
    config = {
      repetitions = 2
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 8, y = 6},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 8, y = 7},
  
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.repetitions}}
    end,
  
    calculate = function(self, card, context)
      if context.repetition and context.cardarea == G.play then
        return {
            message = localize('k_again_ex'),
            repetitions = card.ability.repetitions,
            card = card
        }
      end
    end
  
}
return { name = {"Jokers"}, items = {angoulevent} }
