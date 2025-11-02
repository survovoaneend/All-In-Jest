local straight_to_hell = {
  object_type = "Joker",
  order = 156,

  key = "straight_to_hell",
  config = {
    extra = {
      xmult = 1,
      xmult_mod = 0.25
    }
  },
  rarity = 2,
  pos = { x = 0, y = 6},
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
    if context.pre_discard then
        if not context.blueprint then
            if G.hand and G.hand.highlighted and #G.hand.highlighted > 0 then
                local hand_info, disp_text ,poker_hands = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                if next(poker_hands['Straight']) then
                    SMODS.scale_card(card, {
	                    ref_table = card.ability.extra,
                        ref_value = "xmult",
	                    scalar_value = "xmult_mod",
                        message_key = 'a_xmult'
                    })

                    return nil, true
                end
            end
        end
    end

    if context.joker_main then
        if card.ability.extra.xmult > 1 then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
    end
  end
}
return { name = {"Jokers"}, items = {straight_to_hell} }