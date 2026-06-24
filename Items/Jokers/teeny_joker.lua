local teeny_joker = {
  object_type = "Joker",
  order = 122,

  key = "teeny_joker",
  config = {
    extra = {
      chips = 150,
    }
  },
  rarity = 1,
  pos = { x = 2, y = 9},
  atlas = 'joker_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips,
      }
    }
  end,

  calculate = function(self, card, context)
    local twos, all_cards = 0, 0
    if context.joker_main then
      for k, v in ipairs(context.full_hand) do
        all_cards = all_cards + 1
        if v:get_id() == 2 then
          twos = twos + 1
        end
      end
     if twos == all_cards then 
        return {
          chips = card.ability.extra.chips,
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
      ---@type JDJokerDefinition
      return {
          text = {
              { text = "+" },
              { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" }
          },
          text_config = { colour = G.C.CHIPS },
          calc_function = function(card)
              local text, _, scoring_hand = JokerDisplay.evaluate_hand()
              card.joker_display_values.chips = 0
              if text ~= 'Unknown' then
                  local twos, all_cards = 0, 0
                  for _, scoring_card in pairs(scoring_hand) do
                    all_cards = all_cards + 1
                    if scoring_card:get_id() == 2 then
                        twos = twos + 1
                    end
                  end
                  if twos == all_cards and all_cards > 0 then
                      card.joker_display_values.chips = card.ability.extra.chips or 0
                  end
              end
          end
      }
  end
}
return { name = {"Jokers"}, items = {teeny_joker} }
