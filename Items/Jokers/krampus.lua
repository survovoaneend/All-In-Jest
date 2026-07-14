local krampus = {
  object_type = "Joker",
  order = 39,

  
  key = "krampus",

  config = {
      extra = {
          dollars = 5
      }
  },

  rarity = 2,
  pos = { x = 11, y = 1 }, 
  atlas = 'joker_atlas',
  cost = 7,
  unlocked = true,
  discovered = false,


  blueprint_compat = true,
  eternal_compat = true,
  enhancement_gate = "m_gold",

  loc_vars = function(self, info_queue, card)

      info_queue[#info_queue+1] = G.P_CENTERS.m_gold
      info_queue[#info_queue+1] = G.P_CENTERS.m_stone
      return { vars = { card.ability.extra.dollars } }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local enhanced_a_card = false
      if context.scoring_hand and #context.scoring_hand > 0 then
        for k, v in ipairs(context.scoring_hand) do
          if v.config.center == G.P_CENTERS.m_gold and not v.debuff then
            v:set_ability(G.P_CENTERS.m_stone, nil, true)
            enhanced_a_card = true
            G.E_MANAGER:add_event(Event({
              func = function()
                if v and not v.removed then
                  v:juice_up()
                end
                return true
              end
            }))
          end
        end
      end
      if enhanced_a_card then
        return {
          message = 'Stone',
          colour = G.C.JOKER_GREY
        }
      end
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card.config.center == G.P_CENTERS.m_stone then
        local dollar_bonus = card.ability.extra.dollars
        return {
          dollars = dollar_bonus,
          card = card,
          colour = G.C.MONEY
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
      ---@type JDJokerDefinition
      return {
          text = {
              { text = "$" },
              { ref_table = "card.joker_display_values", ref_value = "dollars", retrigger_type = "mult" }
          },
          text_config = { colour = G.C.GOLD },
          reminder_text = {
              { text = "(" },
              { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
              { text = ")" },
          },
          calc_function = function(card)
              local dollars = 0
              local text, _, scoring_hand = JokerDisplay.evaluate_hand()
              if text ~= 'Unknown' then
                  for _, scoring_card in pairs(scoring_hand) do
                      if scoring_card.ability.name and scoring_card.ability.name == 'Stone Card' then
                          dollars = dollars + card.ability.extra.dollars * JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                      end
                  end
              end
              card.joker_display_values.dollars = dollars
              card.joker_display_values.localized_text = localize { type = 'name_text', set = 'Enhanced', key = 'm_stone' }
          end
      }
  end
}
return { name = { "Jokers" }, items = { krampus } }
