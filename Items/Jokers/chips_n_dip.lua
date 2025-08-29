local chips_n_dip = {
    object_type = "Joker",
    order = 297,
    
    key = "chips_n_dip",
    config = {
        extra = {
            xchips = 3,
            xchips_mod = 0.5
        }
    },
    rarity = 2,
    pos = { x = 19, y = 11},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    pools = {
        Food = true
    },
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.xchips_mod
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and context.main_eval then
            if card.ability.extra.xchips > 0 then
                if (card.ability.extra.xchips - card.ability.extra.xchips_mod) <= 1 then
                    SMODS.scale_card(card, {
	                    ref_table = card.ability.extra,
                        ref_value = "xchips",
	                    scalar_value = "xchips_mod",
                        operation = '-',
                        scaling_message = {
	                        message = localize('k_eaten_ex'),
                            colour = G.C.RED
                        }
                    })
                else
                    SMODS.scale_card(card, {
	                    ref_table = card.ability.extra,
                        ref_value = "xchips",
	                    scalar_value = "xchips_mod",
                        operation = '-',
                        scaling_message = {
	                        message = "-"..card.ability.extra.xchips_mod.."X", 
                            colour = G.C.BLUE
                        }
                    })
                end
                if card.ability.extra.xchips <= 1 then
                    G.E_MANAGER:add_event(Event({
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
                end
            end
        end
        if context.joker_main then
            return {
                xchips = card.ability.extra.xchips
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {chips_n_dip} }
