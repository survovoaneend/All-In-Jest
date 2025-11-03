local low_priest = {
  object_type = "Joker",
  order = 72,

  key = "low_priest",
  config = {
    extra = {
      mult = 0,
      initial_mult = 20,
      mult_mod = 5
    }
  },
  rarity = 1,
  pos = { x = 1, y = 9 },
  atlas = 'joker_atlas',
  cost = 5,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.initial_mult,
        card.ability.extra.mult_mod
      }
    }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      card.ability.extra.mult = card.ability.extra.initial_mult - card.ability.extra.mult_mod * to_number(G.GAME.hands[context.scoring_name].level)
      return {
        mult = math.max(0, card.ability.extra.mult)
      }
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
            calc_function = function(card)
                local text, _, _ = JokerDisplay.evaluate_hand()
                card.joker_display_values.mult = math.max(0, card.ability.extra.initial_mult - 
                  ((text ~= "Unknown" and G.GAME and G.GAME.hands and G.GAME.hands[text]) and 
                  to_number(G.GAME.hands[text].level) or 0) * card.ability.extra.mult_mod)
            end
        }
    end
}
return { name = { "Jokers" }, items = { low_priest } }
