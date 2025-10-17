local punk_joker = {
    object_type = "Joker",
    order = 50,

    key = "punk_joker",
    config = {
      
    },
    rarity = 2,
    pos = { x = 21, y = 1 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_wild
    end,
  
    calculate = function(self, card, context)
      if context.before and context.scoring_hand then
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
                  card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {
                    message = 'Wild!', 
                  })
              end
            end
          end
      end
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

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { ref_table = "card.joker_display_values", ref_value = "active" }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE, retrigger_type = "mult" },
                { text = ")" },
            },
            calc_function = function(card)
                local active = false
                local played_hand = JokerDisplay.current_hand
                for _, played_card in pairs(played_hand) do
                    if played_card.ability.name and played_card.ability.name == 'Wild Card' then
                        active = true
                        break
                    end
                end
                card.joker_display_values.active = active and localize("k_active_ex") or localize("jdis_inactive")
                card.joker_display_values.localized_text = localize { type = 'name_text', set = 'Enhanced', key = 'm_wild' }
            end
        }
    end,
  
}
return { name = {"Jokers"}, items = {punk_joker} }
