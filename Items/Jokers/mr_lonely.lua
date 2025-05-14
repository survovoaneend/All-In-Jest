local mr_lonely = {
  object_type = "Joker",
  order = 204,

  key = "mr_lonely",
  config = {
    extra = {
      chips = 0,
      chip_mod = 10
    }
  },
  rarity = 2,
  pos = { x = 18, y = 7 },
  atlas = 'joker_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chip_mod,
        card.ability.extra.chips
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
          if (G.jokers.config.card_limit - #G.jokers.cards) > 0 then
            card.ability.extra.chips = card.ability.extra.chips +
                card.ability.extra.chip_mod * (G.jokers.config.card_limit - #G.jokers.cards)
            return true
          else
            return true
          end
        end
      }))

      card.ability.extra.round_ended_processed = true
      if (G.jokers.config.card_limit - #G.jokers.cards) > 0 then
        return {
          message = localize('k_upgrade_ex'),
          card = card

        }
      else
        return true
      end
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
return { name = {"Jokers"}, items = {mr_lonely} }

