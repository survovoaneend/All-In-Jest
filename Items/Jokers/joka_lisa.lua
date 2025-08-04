local joka_lisa = {
  object_type = "Joker",
  order = 171,

  key = "joka_lisa",
  config = {
    extra = {
      xmult_mod = 1,
    }
  },
  rarity = 3,
  pos = { x = 14, y = 6},
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  loc_vars = function(self, info_queue, card)
    local xmult = 1
    if G.hand then
    G.hand.config.card_limit = G.hand.config.card_limit or 8
    if G.hand.config.card_limit then 
      xmult = G.hand.config.card_limit - 7
    end
    end
    if xmult < 1 then
      xmult = 1
    end
    return {
      vars = {
        card.ability.extra.xmult_mod,
        xmult
      }
    }

  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local xmult = 1
      if G.hand.config.card_limit then
        xmult = G.hand.config.card_limit - 7
      end
      if xmult < 1 then
        xmult = 1
      end
      return {
        xmult = xmult
      }
    end
  end
}
return { name = {"Jokers"}, items = {joka_lisa} }
