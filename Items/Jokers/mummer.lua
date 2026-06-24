local mummer = {
  object_type = "Joker",
  order = 158,

  key = "mummer",
  config = {
    triggers = "0"
  },
  rarity = 3,
  pos = { x = 2, y = 6 },
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
  end,

  in_pool = function(self, args)
    if G.deck then
      if #G.deck.cards > 0 then
        for i = 1, #G.deck.cards do
          if SMODS.has_enhancement(G.deck.cards[i], 'm_steel') then
            return true
          end
        end
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, 'm_steel') then
        local juiced_card = context.blueprint_card or card;
        return {
          card = juiced_card,
          func = function()
            if G.hand then
              if #G.hand.cards > 0 then
                for i = 1, #G.hand.cards do
                  if SMODS.has_enhancement(G.hand.cards[i], 'm_steel') then
                    G.E_MANAGER:add_event(Event({
                      func = function()
                        juiced_card:juice_up()
                        return true
                      end
                    }))
                    SMODS.score_card(G.hand.cards[i], { cardarea = G.hand, main_scoring = true })
                  end
                end
              end
            end
          end
        }
      end
    end
  end,
  joker_display_def = function(JokerDisplay)
      ---@type JDJokerDefinition
      return {
          text = {
            {
              border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult" },
              }
            }
          },
          calc_function = function(card)
            local playing_hand = next(G.play.cards)
            local x_mult = 1
            local count = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
              count = 0
              for _, scoring_card in pairs(scoring_hand) do
                  if SMODS.has_enhancement(scoring_card, 'm_steel') then
                    local count_played = JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand, false)
                    count = count + 1
                    for _, playing_card in ipairs(G.hand.cards) do
                      if playing_hand or not playing_card.highlighted then
                        if SMODS.has_enhancement(playing_card, 'm_steel') then
                            local triggers = JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                            if triggers > 0 and card.joker_display_values.count then
                              triggers = triggers - JokerDisplay.calculate_joker_triggers(card) * card.joker_display_values.count -- don't count the triggers from the retrigger function
                            end
                            local eval = eval_card(playing_card, { cardarea = G.hand, main_scoring = true })
                            local mult = eval.playing_card.x_mult or 1
                            x_mult = x_mult * (mult ^ (triggers * count_played))
                        end
                      end
                    end
                  end
                end
            end
            card.joker_display_values.x_mult = x_mult
            card.joker_display_values.count = count
          end,
          retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
              if not held_in_hand then return 0 end
              return held_in_hand and SMODS.has_enhancement(playing_card, 'm_steel') and joker_card.joker_display_values.count and JokerDisplay.calculate_joker_triggers(joker_card) * joker_card.joker_display_values.count or 0
          end
      }
  end,
}
return { name = { "Jokers" }, items = { mummer } }
