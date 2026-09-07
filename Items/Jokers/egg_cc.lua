local egg_cc = {
    object_type = "Joker",
    order = 230,

    key = "egg_cc",
    config = {
      extra = {
        chips = 0,
        chip_mod = 9,
        sell_value = 1
      }
    },
    attributes = { 'food', 'scaling', 'sell_value', 'chips', 'egg' },
    rarity = 1,
    pos = { x = 14, y = 8},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = {
        Food = true
    },
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.chips,
          card.ability.extra.chip_mod,
          card.ability.extra.sell_value
        }
      }
    end,
  
    calculate = function(self, card, context)
      if context.end_of_round and not context.blueprint and context.main_eval  then
        G.E_MANAGER:add_event(Event({
          func = function()
              SMODS.scale_card(card, {
	            ref_table = card.ability.extra,
                ref_value = "chips",
	            scalar_value = "chip_mod",
                no_message = true,
              })
              SMODS.scale_card(card, {
	            ref_table = card.ability,
                ref_value = "extra_value",
                scalar_table = card.ability.extra,
	            scalar_value = "sell_value",
                no_message = true,
              })
              card:set_cost()
              return true
          end
        }))
        return {
          message = localize('k_upgrade_ex'),
        }
        
      end
      if context.joker_main and card.ability.extra.chips > 0 then
        return {
          chips = card.ability.extra.chips,
        }
      end
    end
  
}
return { name = {"Jokers"}, items = {egg_cc} }
