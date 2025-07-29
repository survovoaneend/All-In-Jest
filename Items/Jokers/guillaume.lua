local guillaume = {
    object_type = "Joker",
    order = 1026,

    key = "guillaume",
    config = {
      extra = {
        joker_slots = 0,
        joker_slots_mod = 1,
      }
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 5, y = 4},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    soul_pos = { x = 5, y = 5},
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.joker_slots,
                card.ability.extra.joker_slots_mod
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.end_of_round and G.jokers and not context.blueprint and G.GAME.blind.boss and #G.jokers.cards < 5 and context.main_eval then
        card_eval_status_text(card,'extra',nil,nil,nil,{message='+1 Joker Slot'})
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots_mod
        card.ability.extra.joker_slots = card.ability.extra.joker_slots + card.ability.extra.joker_slots_mod
      end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.joker_slots
    end,
  
}
return { name = {"Jokers"}, items = {guillaume} }
