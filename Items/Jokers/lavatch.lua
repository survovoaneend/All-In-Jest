local lavatch = {
    object_type = "Joker",
    order = 1048,

    key = "lavatch",
    config = {
      extra = {
        xmult = 1,
        xmult_mod = 0.05
      }
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 7, y = 8},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 7, y = 9},
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.xmult,
          card.ability.extra.xmult_mod
        }
      }
    end,
  
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
        if context.other_card:is_suit('Clubs') and not context.blueprint then
          card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
          return {
            message = localize('k_upgrade_ex'),
            x_mult = card.ability.extra.xmult,
            card = card,
            colour = G.C.RED
          }
        end
      end
    end
  
}
return { name = {"Jokers"}, items = {lavatch} }
