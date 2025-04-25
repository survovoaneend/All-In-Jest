SMODS.Joker {
    key = "egg_cc",
    config = {
      extra = {
        chips = 9,
        chip_mod = 9,
        sell_value = 2
      }
    },
    rarity = 1,
    pos = { x = 14, y = 8},
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
          card.ability.extra.chip_mod,
          card.ability.extra.sell_value
        }
      }
    end,
  
    calculate = function(self, card, context)
      if context.end_of_round and not context.blueprint then
        if card.ability.extra.round_ended_processed then
          return nil
        end
        G.E_MANAGER:add_event(Event({
          func = function()
              card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
              card.ability.extra_value = card.ability.extra_value + card.ability.extra.sell_value
              card:set_cost()
              return true
          end
        }))
        card.ability.extra.round_ended_processed = true
        return {
          message = localize('k_upgrade_ex'),
        }
        
      end
      if context.joker_main and card.ability.extra.chips > 0 then
        return {
          chips = card.ability.extra.chips,
        }
      end
      if context.setting_blind then
        card.ability.extra.round_ended_processed = false
      end
    end
  }