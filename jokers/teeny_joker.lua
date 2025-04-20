SMODS.Joker {
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
  discovered = true,
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
  end
}