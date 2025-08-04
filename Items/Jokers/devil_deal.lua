local devil_deal = {
    object_type = "Joker",
    order = 238,

    key = "devil_deal",
    config = {
      extra = {
        xmult = 1,
        xmult_mod = 0.2
      }
    },
    rarity = 2,
    pos = { x = 6, y = 9},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_mod,
                card.ability.extra.xmult
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.remove_playing_cards and not context.blueprint then
      local hearts = 0
      for k, val in ipairs(context.removed) do
        if val:is_suit("Hearts") then hearts = hearts + 1 end
      end
      if hearts > 0 then
        card.ability.extra.xmult = card.ability.extra.xmult + (hearts * card.ability.extra.xmult_mod)
        return {
          message = "X"..card.ability.extra.xmult.. " Mult",
        }
      end
      return
    end
    if context.cards_destroyed and not context.blueprint then
      local hearts = 0
      for k, val in ipairs(context.glass_shattered) do
        if val:is_suit("Hearts") then hearts = hearts + 1 end
      end
      if hearts > 0 then
        card.ability.extra.xmult = card.ability.extra.xmult + (hearts * card.ability.extra.xmult_mod)
        return {
          message = "X"..card.ability.extra.xmult.. " Mult"
        }
      end
      return
    end
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult,
      }
    end
    end
  
}
return { name = {"Jokers"}, items = {devil_deal} }
