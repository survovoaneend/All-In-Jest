local trypophobia = {
    object_type = "Joker",
    order = 16,

    key = "trypophobia",
    config = {
      extra = {
        mult = 20,
      }
    },
    rarity = 1,
    pos = All_in_Jest.config.alter_trypophobia and { x = 3, y = 14 } or { x = 15, y = 0 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.mult,
        }
      }
    end,
  
    calculate = function(self, card, context)
      
      local eights, all_cards = 0, 0
      if context.joker_main then
        for k, v in ipairs(context.scoring_hand) do
          all_cards = all_cards + 1
          if v:get_id() == 8 then
            eights = eights + 1
          end
        end
       if eights == all_cards then 
          return {
            mult = card.ability.extra.mult,
          }
        end
      end
    end,
    
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.MULT },
            reminder_text = {
                { text = "(8)" },
            },
            calc_function = function(card)
                local eights, all_cards = 0, 0
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        all_cards = all_cards + 1
                        if scoring_card:get_id() == 8 then
                            eights = eights + 1
                        end
                    end
                end
                card.joker_display_values.mult = eights == all_cards and all_cards > 0 and card.ability.extra.mult or 0
            end
        }
    end
  
}
return { name = {"Jokers"}, items = {trypophobia} }
