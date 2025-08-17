local fish_fingers = {
    object_type = "Joker",
    order = 301,

    key = "fish_fingers",
    config = {
      extra = {
        hands = 3,
        hand_mod = 1
      }
    },
    rarity = 2,
    pos = { x = 23, y = 11},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
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
        if context.setting_blind and not context.blueprint then 
            ease_hands_played(card.ability.extra.hands)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_hands', vars = {card.ability.extra.hands}}})
        end
        if context.end_of_round and context.main_eval and not context.blueprint then
            if card.ability.extra.hands > 0 then
                card.ability.extra.hands = card.ability.extra.hands - card.ability.extra.hand_mod
                 if card.ability.extra.hands <= 0 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('tarot1')
                            card.T.r = -0.2
                            card:juice_up(0.3, 0.4)
                            card.states.drag.is = true
                            card.children.center.pinch.x = true
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.3,
                                blockable = false,
                                func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                    return true;
                                end
                            }))
                            return true
                        end
                    }))
                    return {
                        message = localize('k_eaten_ex'),
                        colour = G.C.RED
                    }
                else
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = "-1 Hand", colour = G.C.BLUE})
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {fish_fingers} }
