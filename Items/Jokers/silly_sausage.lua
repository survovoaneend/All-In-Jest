local silly_sausage = {
    object_type = "Joker",
    order = 57,
    
    key = "silly_sausage",
    config = {
        extra = {
            current_discount = 5,
            prev_discount = "0"
        }
    },
    rarity = 1,
    pos = { x = 3, y = 2 },
    atlas = 'joker_atlas',
    cost = 4,
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
                card.ability.extra.current_discount
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - card.ability.extra.current_discount
        G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost - card.ability.extra.current_discount)
        card.ability.extra.prev_discount = tostring(card.ability.extra.current_discount)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + card.ability.extra.current_discount
        G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + card.ability.extra.current_discount)
    end,
  
    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and context.main_eval then
            local discount_this_round = card.ability.extra.current_discount
            if card.ability.extra.current_discount > 0 then
                if tonumber(card.ability.extra.prev_discount) ~= card.ability.extra.current_discount then
                    local removeamt = card.ability.extra.current_discount - tonumber(card.ability.extra.prev_discount) 
                    G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - removeamt
                    G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost - removeamt)
                end
                G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + discount_this_round
                G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + discount_this_round)
                card.ability.extra.current_discount = card.ability.extra.current_discount - 1

                if card.ability.extra.current_discount <= 0 then
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
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = "-$1 Discount", colour = G.C.RED })
                    G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - card.ability.extra.current_discount
                    G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost - card.ability.extra.current_discount)
                    card.ability.extra.prev_discount = tostring(card.ability.extra.current_discount)
                end
                calculate_reroll_cost(true)
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {silly_sausage} }
