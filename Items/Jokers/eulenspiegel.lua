local eulenspiegel = {
    object_type = "Joker",
    order = 1013,
     ignore = true,
    key = "eulenspiegel",
    config = {
      Xmult = 3,
      Xmult_mod = 0.75,
      ante_mod = 1
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 2, y = 2},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 2, y = 3},
  
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.ante_mod, card.ability.Xmult_mod, card.ability.Xmult }}
    end,
  
    calculate = function(self, card, context)
      if context.end_of_round and context.cardarea == G.jokers then
        if G.GAME.blind.boss then
            ease_ante(-card.ability.ante_mod)
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "-"..card.ability.ante_mod.." Ante", colour = G.C.FILTER})
            card.ability.Xmult = card.ability.Xmult - card.ability.Xmult_mod
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "-"..card.ability.Xmult_mod.." XMult", colour = G.C.MULT})
        end
      end
      if context.joker_main then
        local xmlt = card.ability.Xmult
        return {
            message = localize{type='variable',key='a_xmult',vars={xmlt}},
            Xmult_mod = xmlt,
        }
      end
      if card.ability.Xmult == 0 then
        self:start_dissolve()
      end
    end
}
return { name = {"Jokers"}, items = {eulenspiegel} }
