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
                local hand_info = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                if hand_info == 'Straight' or hand_info == 'Straight Flush' or hand_info == 'Straight Spectrum' or hand_info == 'Royal Flush' or hand_info == 'Royal Spectrum'  or (G.jokers and next(SMODS.find_card('j_aij_string_theory'))) then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod

                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = 'X'..number_format(card.ability.extra.xmult).. ' Mult',
                        colour = G.C.MULT
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
