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
      if (context.remove_playing_cards or context.cards_destroyed) and not context.blueprint then
        local removed_cards = context.glass_shattered or context.removed
        local hearts = 0
        for k, val in ipairs(removed_cards) do
            if val:is_suit("Hearts", false, true) then hearts = hearts + 1 end
        end
        for _ = 1, hearts do
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_mod",
                message_key = 'a_xmult'
            })
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
