local low_priest = {
  object_type = "Joker",
  order = 72,

  key = "low_priest",
  config = {
    extra = {
      mult = 0,
      initial_mult = 20,
      mult_mod = 2
    }
  },
  rarity = 2,
  pos = { x = 1, y = 9 },
  atlas = 'joker_atlas',
  cost = 7,
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
        SMODS.scale_card(card, {
	        ref_table = card.ability.extra,
            ref_value = "mult",
	        scalar_value = "mult_mod",
            operation = function(ref_table, ref_value, initial, change)
	            ref_table[ref_value] = ref_table['initial_mult'] - change * to_number(G.GAME.hands[context.scoring_name].level))
            end,
            no_message = true,
        })
      return {
        mult = math.max(0, card.ability.extra.mult)
      }
    end
  end
}
return { name = { "Jokers" }, items = { low_priest } }
