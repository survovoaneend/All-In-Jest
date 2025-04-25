SMODS.Joker {
    key = "cesar",
    config = {
      extra = {
        money = 0,
        money_mod = 1
      }
    },
    rarity = 3,
    pos = { x = 20, y = 9},
    atlas = 'joker_atlas',
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
          vars = {
            card.ability.extra.money,
            card.ability.extra.money_mod
          }
        }
    end,
  
    calculate = function(self, card, context)
      local diamond_kings, all_cards = 0, 0
      if context.before then
        for k, v in ipairs(context.full_hand) do
          all_cards = all_cards + 1
          if v:get_id() == 13 and v:is_suit('Diamonds') then
            diamond_kings = diamond_kings + 1
          end
        end
       if diamond_kings == all_cards and not context.blueprint then 
          card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_mod
          return {
            message = localize('k_upgrade_ex')
          }
        end
      end
    end,
    calc_dollar_bonus = function(self, card)
      if card.ability.extra.money > 0 then
          local dollar_bonus = card.ability.extra.money
          return dollar_bonus
      end
  end
  }