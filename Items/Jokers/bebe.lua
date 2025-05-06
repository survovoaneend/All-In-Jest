local bebe = {
    object_type = "Joker",
    order = 1042,
    

    key = "bebe",
    config = {
      extra = {
        hands_size = 4
      }
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 1, y = 8},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 1, y = 9},
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.hands_size
        }
      }
    end,
  
    calculate = function(self, card, context)
      
    end,
    add_to_deck = function(self, card, from_debuff)
      G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands_size
    end,
    remove_from_deck = function(self, card, from_debuff)
      G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands_size
    end


  
}
return { name = {"Jokers"}, items = {bebe} }
