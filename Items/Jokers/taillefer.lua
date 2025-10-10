local taillefer = {
    object_type = "Joker",
    order = 1030,

    key = "taillefer",
    config = {
      extra = {
        xmult = 1,
        xmult_mod = 0.5,
        boss_blinds = 4,
        current_boss_blinds = 0
      }
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 9, y = 4},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    soul_pos = { x = 9, y = 5},
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmult_mod,
                card.ability.extra.boss_blinds,
                card.ability.extra.current_boss_blinds
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.before and not context.blueprint then 
        SMODS.scale_card(card, {
	        ref_table = card.ability.extra,
            ref_value = "xmult",
	        scalar_value = "xmult_mod",
            operation = '+',
            scaling_message = {
	            message = localize('k_upgrade_ex'),
	            colour = G.C.FILTER
            }
        })
      end 
      if context.joker_main then
        return {
            xmult = card.ability.extra.xmult,
        }
      end
      if context.end_of_round and G.GAME.blind.boss and not context.blueprint and context.main_eval then
        card.ability.extra.current_boss_blinds = card.ability.extra.current_boss_blinds + 1
        if card.ability.extra.current_boss_blinds >= card.ability.extra.boss_blinds then
            SMODS.destroy_cards(card, nil, nil, true)
            return {
                message = 'Killed',
                colour = G.C.RED
            }
        else 
            return {
                message = card.ability.extra.current_boss_blinds .. '/' .. card.ability.extra.boss_blinds
            }
        end
      end
    end
  
}
return { name = {"Jokers"}, items = {taillefer} }
