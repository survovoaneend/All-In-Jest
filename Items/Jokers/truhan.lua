local truhan = {
    object_type = "Joker",
    order = 220,

    key = "truhan",
    config = {
      extra = {
        xmult = 1,
        xmult_mod = 0.1
      }
    },
    rarity = 1,
    pos = { x = 9, y = 8},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmult_mod
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.jest_destroying_joker then
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
        return {
          message = localize('k_upgrade_ex')
        }
      end
      if context.joker_main then
        return {
          xmult = card.ability.extra.xmult,
        }
      end
    end
  
}
return { name = {"Jokers"}, items = {truhan} }
