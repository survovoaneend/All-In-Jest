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
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
        return {
            message = localize('k_upgrade_ex')
        }
      end 
      if context.joker_main then
        return {
            xmult = card.ability.extra.xmult,
        }
      end
      if context.end_of_round and G.GAME.blind.boss and not context.blueprint and context.main_eval then
        card.ability.extra.current_boss_blinds = card.ability.extra.current_boss_blinds + 1
        if card.ability.extra.current_boss_blinds >= card.ability.extra.boss_blinds then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3,
                blockable = false,
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        blockable = false,
                        func = function()
                            G.jokers:remove_card(card)
                            card:remove()
                            card = nil
                            return true;
                        end
                    }))
                    return true
                end
            }))
            return {
                message = 'Killed',
                colour = G.C.RED
            }
        else 
            card_eval_status_text(card, 'extra', nil, nil, nil, { message = card.ability.extra.current_boss_blinds .. '/' .. card.ability.extra.boss_blinds})
        end
        
      end
    end
  
}
return { name = {"Jokers"}, items = {taillefer} }
