local public_bathroom = {
  object_type = "Joker",
  order = 30,

  key = "public_bathroom",
  config = {
    extra = {
      mult = 0,
      mult_mod = 2
    }
  },
  rarity = 1,
  pos = { x = 3, y = 1 },
  atlas = 'joker_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult_mod,
        card.ability.extra.mult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and not context.blueprint then
      if context.poker_hands and next(context.poker_hands['Flush']) and context.other_card:get_id() == 2 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          scalar_value = "mult_mod",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + change
          end,
          no_message = true,
        })

        return {
          extra = { focus = card, message = localize('k_upgrade_ex') },
          card = card
        }
      end
    end
    if context.joker_main then
      if card.ability.extra.mult > 0 then
        return {
          mult = card.ability.extra.mult
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
      ---@type JDJokerDefinition
      return {
          text = {
              { text = "+" },
              { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
          },
          text_config = { colour = G.C.MULT },
          reminder_text = {
              { text = "(" },
              { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
              { text = ")" },
          },
          calc_function = function(card)
              card.joker_display_values.localized_text = localize('Flush', 'poker_hands')
          end
      }
  end

}
return { name = { "Jokers" }, items = { public_bathroom } }
