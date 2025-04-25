SMODS.Joker {
    key = "punk_joker",
    config = {
      
    },
    rarity = 2,
    pos = { x = 21, y = 1 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_wild
    end,
  
    calculate = function(self, card, context)
      if context.before and context.scoring_hand and not context.blueprint then
          local has_wild = false
          for _, scoring_card in ipairs(context.scoring_hand) do
              if scoring_card.config.center.key == 'm_wild' then
                  has_wild = true
                  break
              end
          end
          if has_wild then
            local eligible_targets = {}
            for _, card_in_hand in ipairs(context.scoring_hand) do
                if card_in_hand.config.center == G.P_CENTERS.c_base then
                    table.insert(eligible_targets, card_in_hand)
                end
            end

            if #eligible_targets > 0 then
              local target_card = pseudorandom_element(eligible_targets, pseudoseed('punk'))

              if target_card then
                  target_card:set_ability(G.P_CENTERS.m_wild, false, true)
                  G.E_MANAGER:add_event(Event({
                    func = function()
                        target_card:juice_up()
                        return true
                    end
                })) 
                  card_eval_status_text(card, 'extra', nil, nil, nil, {
                      message = 'Wild!', 
                  })
                  return true 
              end
          end
          end
      end

     
      return nil
    end,
    in_pool = function(self, args)
        local wild = 0
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.config.center.key == 'm_wild' then
                    wild = wild + 1
                end
            end
        end
        if wild > 0 then
            return true
        else
            return false
        end
      end,
  }