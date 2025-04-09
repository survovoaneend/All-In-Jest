SMODS.Joker {
    key = "quark",
    config = {
      
    },
    loc_txt = {
      name = "Quark",
      text ={
          "Levels up {C:attention}Three of a Kind{} if",
          "{C:attention}scored hand{} contains exactly {C:attention}3{}",
          "cards and {C:attention}3{} unique suits."
      },
  },
    rarity = 2,
    pos = { x = 16, y = 3 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
       -- Phase 1: Check if we need to update the stored multiplier (after scoring)
       if context.after and context.scoring_name then
        -- Don't modify the state if this is a Blueprint calculation
        if not context.blueprint then
            -- Check if the played hand was a Full House
            if context.scoring_name == 'Full House' then
                -- Increase the stored multiplier
                local bonus_add = card.ability.extra.bonus_per_full_house or 0.5
                card.ability.extra.current_xmult = card.ability.extra.current_xmult + bonus_add

                -- Provide feedback
                card:juice_up(0.4, 0.4)
                play_sound('button')
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = '+' .. number_format(bonus_add) .. ' XMult',
                    colour = G.C.MULT -- Use Mult color for positive feedback
                })
                -- Return nil, true because we modified state but didn't affect score *this* turn
                return nil, true
            else
                -- If a non-Full House hand was played AND the bonus is > 1, reset it
                if card.ability.extra.current_xmult > 1 then
                    card.ability.extra.current_xmult = 1
                    -- Provide feedback
                    card:juice_up(0.4, 0.4)
                    play_sound('button', 0.8) -- Lower pitch for reset sound
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = 'Reset!',
                        colour = G.C.RED -- Use Red color for negative/reset feedback
                    })
                    -- Return nil, true because we modified state
                    return nil, true
                end
            end
        end
    end

    -- Phase 2: Apply the stored multiplier during the main scoring calculation
    if context.joker_main then
        -- Only apply if the stored multiplier is greater than 1 (meaning there's a bonus)
        if card.ability.extra.current_xmult > 1 then
            -- Return the effect table to apply the Xmult
            return {
                Xmult_mod = card.ability.extra.current_xmult,
                card = card, -- Reference this card for effects system
                message = localize{ type = 'variable', key = 'a_xmult', vars = { number_format(card.ability.extra.current_xmult) } }
                -- Alternatively, a simpler message: message = 'x'..number_format(card.ability.extra.current_xmult)..' Mult'
            }
        end
    end
    end
  }