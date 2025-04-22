SMODS.Joker {
    key = "punk_joker",
    config = {
      
    },
    rarity = 2,
    pos = { x = 21, y = 1 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_wild
    end,
  
    calculate = function(self, card, context)
      -- Check *after* scoring is done but *before* cards go to discard
      if context.before and context.scoring_hand and not context.blueprint then
          local has_wild = false
          -- Check if the *scoring* hand contained an actual Wild Card
          for _, scoring_card in ipairs(context.scoring_hand) do
              if scoring_card.config.center.key == 'm_wild' then
                  has_wild = true
                  break
              end
          end

          -- If a Wild Card was part of the score...
          if has_wild then
            local eligible_targets = {}
            -- Find all non-enhanced cards within the scoring hand
            for _, card_in_hand in ipairs(context.scoring_hand) do
                if card_in_hand.config.center == G.P_CENTERS.c_base then
                    table.insert(eligible_targets, card_in_hand)
                end
            end

            if #eligible_targets > 0 then
              -- Select one random card from the eligible targets
              -- Using pseudorandom for potential determinism if needed, math.random works too
              local target_card = pseudorandom_element(eligible_targets, pseudoseed('random_wild_contagion'))

              if target_card then
                  -- Enhance the target card permanently to Wild Card
                  target_card:set_ability(G.P_CENTERS.m_wild, false, true) -- Apply enhancement
                  G.E_MANAGER:add_event(Event({
                    func = function()
                        target_card:juice_up()
                        return true
                    end
                })) 
                  card_eval_status_text(card, 'extra', nil, nil, nil, {
                      message = 'Spread!', -- Or 'Contagion!', 'Wild!', etc.
                  })
                  return true -- Indicate the Joker did something
              end
          end
          end
      end

      -- If no relevant context, do nothing
      return nil
    end
  }