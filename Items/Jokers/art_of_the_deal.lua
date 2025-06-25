local art_of_the_deal = {
    object_type = "Joker",
    order = 40,

    key = "art_of_the_deal",
    config = {
      extra = {
        mult = 0,
        mult_mod = 1
      }
    },
    rarity = 2,
    pos = { x = 12, y = 1 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
  
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult, card.ability.extra.mult_mod} }
    end,
  
    calculate = function(self, card, context)
      if context.jest_money_earned and context.jest_earned_sign == "+" and to_big(G.GAME.dollars) > to_big(0) and not context.blueprint then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
        return {
          message = localize('k_upgrade_ex')
        }
      end
      if to_big(G.GAME.dollars) <= to_big(0) and card.ability.extra.mult ~= 0 and not context.blueprint then
        card.ability.extra.mult = 0
        return {
            message = localize('k_reset'),
            colour = G.C.RED
        }
      end
      if context.joker_main then
        if card.ability.extra.mult > 0 then
          return {
            mult = card.ability.extra.mult,
          }
        end
      end
    end
  
}
return { name = {"Jokers"}, items = {art_of_the_deal} }
