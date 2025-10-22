local opening_move = {
    object_type = "Joker",
    order = 274,
    key = "opening_move",
    config = {
      extra = {
          xmult = 0.5,
          cur_xmult = 1,
      }
    },
    rarity = 2,
    pos = { x = 22, y = 10},
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
                card.ability.extra.xmult,
                card.ability.extra.cur_xmult,
            }
        }
    end,
  
    calculate = function(self, card, context)
        -- TODO looks like this can use debuff_hand context?
        if context.aij_before_before and G.GAME.current_round.hands_played <= 0 and not context.blueprint then
            G.GAME.blind:debuff_hand(context.full_hand, G.GAME.hands[context.scoring_name], context.scoring_name, context)
            SMODS.scale_card(card, {
	            ref_table = card.ability.extra,
                ref_value = "cur_xmult",
	            scalar_value = "xmult",
                operation = function(ref_table, ref_value, initial, change)
	                ref_table[ref_value] = 1 + #context.scoring_hand * change
                end,
            })
        end
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.cur_xmult = 1
            return {
                message = localize('k_reset'),
            }
        end
        if context.joker_main then
            if card.ability.extra.cur_xmult > 0 then
                return {
                    Xmult = card.ability.extra.cur_xmult
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {opening_move} }
