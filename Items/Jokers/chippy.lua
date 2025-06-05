local chippy = {
    object_type = "Joker",
    order = 221,

    key = "chippy",
    config = {
      extra = {
          chips = 0
      }
    },
    rarity = 2,
    pos = { x = 10, y = 8},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
        vars = {
          card.ability.extra.chips,
        }
      }
    end,
  
    calculate = function(self, card, context)
      if context.jest_money_earned and context.jest_earned_sign == "-" then
        card.ability.extra.chips = card.ability.extra.chips + -context.jest_earned_amount
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
return { name = {"Jokers"}, items = {chippy} }
