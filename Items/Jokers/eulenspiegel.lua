local eulenspiegel = {
    object_type = "Joker",
    order = 1013,
    
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
    blueprint_compat = true,
    eternal_compat = false,
    soul_pos = { x = 2, y = 3},
  
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.ante_mod, card.ability.Xmult_mod, card.ability.Xmult }}
    end,
  
    calculate = function(self, card, context)
      if context.end_of_round and context.cardarea == G.jokers and context.main_eval then
        if G.GAME.blind.boss and not context.blueprint then
            ease_ante(-card.ability.ante_mod)
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "-"..card.ability.ante_mod.." Ante", colour = G.C.FILTER})
            SMODS.scale_card(card, {
	            ref_table = card.ability,
                ref_value = "Xmult",
	            scalar_value = "Xmult_mod",
                operation = '-',
                message_key = 'a_xmult_minus'
            })
            if card.ability.Xmult <= 0 then
              SMODS.destroy_cards(self, false, true)
            end
        end
      end
      if context.joker_main then
        return {
            xmult = card.ability.Xmult,
        }
      end
      
    end
}
return { name = {"Jokers"}, items = {eulenspiegel} }
