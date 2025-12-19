local fish_fingers = {
    object_type = "Joker",
    order = 301,

    key = "fish_fingers",
    config = {
      extra = {
        hands = 5,
        hand_mod = 1
      }
    },
    rarity = 2,
    pos = { x = 23, y = 11},
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    pools = {
        Food = true
    },
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hands,
                card.ability.extra.hand_mod
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.setting_blind then 
            ease_hands_played(card.ability.extra.hands)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_hands', vars = {card.ability.extra.hands}}})
            return nil, true
        end
        if context.end_of_round and context.main_eval and not context.blueprint then
            if (card.ability.extra.hands - card.ability.extra.hand_mod) <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.RED
                }
            else
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "hands",
                    scalar_value = "hand_mod",
                    operation = '-',
                    message_key = 'a_aij_hands_minus'
                })
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {fish_fingers} }
