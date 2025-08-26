local pell_mel = {
    object_type = "Joker",
    order = 37,

    key = "pell_mel",
    config = {
      extra = {
        xmult_mod = 0.25,
      }
    },
    rarity = 1,
    pos = { x = 10, y = 1 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
          vars = {
            card.ability.extra.xmult_mod,
            card.ability.extra.xmult
          }
        }
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
        card.ability.extra.xmult = 1 + jest_get_unique_suits(context.full_hand, nil, true) * card.ability.extra.xmult_mod
        return {
          xmult = card.ability.extra.xmult
        }
      end
      if context.after then
        card.ability.extra.xmult = 1
      end
    end
  
}

return { name = {"Jokers"}, items = {pell_mel} }

