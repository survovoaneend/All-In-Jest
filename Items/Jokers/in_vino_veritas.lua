local in_vino_veritas = {
    object_type = "Joker",
    order = 137,

    key = "in_vino_veritas",
    config = {
      extra = {
        max_h_size = 5,
        current_h_size = 0,
        h_size_mod = 1,
      }
    },
    rarity = 2,
    pos = { x = 6, y = 5 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
       if context.using_consumeable and not context.blueprint and card.ability.extra.current_hand_size < card.ability.extra.max_hand_size then
         G.hand:change_size(card.ability.extra.hand_size_mod)
         SMODS.scale_card(card, {
	        ref_table = card.ability.extra,
            ref_value = "current_h_size",
	        scalar_value = "h_size_mod",
        })
       end
       if context.end_of_round and context.main_eval and not context.blueprint then
            if card.ability.extra.current_h_size > 0 then
                G.hand:change_size(-card.ability.extra.current_h_size)
                card.ability.extra.current_h_size = 0
            end
            return {
                message = localize('k_reset_ex'),
                colour = G.C.FILTER
            }
       end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.current_h_size > 0 then
            G.hand:change_size(-card.ability.extra.current_h_size)
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if card.ability.extra.current_h_size > 0 then
            G.hand:change_size(card.ability.extra.current_h_size)
        end
    end,
  
}
return { name = {"Jokers"}, items = {in_vino_veritas} }
