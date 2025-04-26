SMODS.Joker {
    key = "doodle",
    config = {
      extra = {
        dir = 0,
        odds = 2
      }
    },
    rarity = 2,
    pos = { x = 24, y = 0 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return { vars = { 
        ''..(G.GAME and G.GAME.probabilities.normal or 1),
        card.ability.extra.odds
      } }
    end,
  --thank you unstable
  calculate = function(self, card, context)
    local my_index = nil
    for i, joker_in_area in ipairs(G.jokers.cards) do
      if joker_in_area == card then
        my_index = i
        break
      end
    end


    if not my_index or #G.jokers.cards <= 1 then
      return
    end

    local target_joker = nil
    local num_jokers = #G.jokers.cards

    if my_index == 1 then  
      target_joker = G.jokers.cards[my_index + 1]
    elseif my_index == num_jokers then 
      target_joker = G.jokers.cards[my_index - 1]
    else                         
      -- Randomly choose left or right
      if pseudorandom('doodle_direction' .. G.SEED) > 0.5 then
        target_joker = G.jokers.cards[my_index + 1]   
      else
        target_joker = G.jokers.cards[my_index - 1]   
      end
    end

    if target_joker and target_joker ~= card and pseudorandom('doodle' .. G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds then
      context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
      context.blueprint_card = context.blueprint_card or card

      if context.blueprint > #G.jokers.cards + 1 then
        return
      end

      local other_joker_ret, trig = target_joker:calculate_joker(context)

      context.blueprint = nil
      local eff_card = context.blueprint_card or card
      context.blueprint_card = nil

      if other_joker_ret or trig then
        if not other_joker_ret then
          other_joker_ret = {}      
        end

        other_joker_ret.card = eff_card         
        other_joker_ret.colour = G.C.GREEN    
        other_joker_ret.no_callback = true     

        return other_joker_ret           
      end
    end
    return nil
  end
  }