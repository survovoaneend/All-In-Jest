local silly_sausage = {
    object_type = "Joker",
    order = 57,
    
    key = "silly_sausage",
    config = {
        extra = {
            current_discount = 5,
            discount_loss = 1,
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
                card.ability.extra.current_discount,
                card.ability.extra.discount_loss
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

                if card.ability.extra.current_discount - card.ability.extra.discount_loss <= 0 then
                    SMODS.destroy_cards(card, nil, nil, true)
                    return {
                        message = localize('k_eaten_ex'),
                        colour = G.C.RED
                    }
                else
                    card.ability.extra.current_discount = card.ability.extra.current_discount - card.ability.extra.discount_loss
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = "-$" .. card.ability.extra.discount_loss .. " Discount", colour = G.C.RED })
                    G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - card.ability.extra.current_discount
                    G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost - card.ability.extra.current_discount)
                    card.ability.extra.prev_discount = tostring(card.ability.extra.current_discount)
                end
                calculate_reroll_cost(true)
            end
        end
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "$" },
                { ref_table = "card.ability.extra", ref_value = "current_discount" },
            },
            text_config = { colour = G.C.GOLD },
        }
    end
  
}
return { name = {"Jokers"}, items = {silly_sausage} }
