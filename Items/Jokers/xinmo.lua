local xinmo = {
    object_type = "Joker",
    order = 1052,
    

    key = "xinmo",
    config = {
      extra = {
        slots = 3,
        h_size = 1
      }
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 1, y = 10},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 1, y = 11},
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.slots,
                card.ability.extra.h_size
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slots
        G.hand:change_size(-card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.slots
        G.hand:change_size(card.ability.extra.h_size)
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {xinmo} }
