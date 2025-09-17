local candy_floss = {
    object_type = "Joker",
    order = 304,
    
    key = "candy_floss",
    config = {
      extra = {
        percent = 30,
        percent_mod = 5
      }
    },
    rarity = 2,
    pos = { x = 1, y = 12},
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
                card.ability.extra.percent,
                card.ability.extra.percent_mod
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and context.main_eval then
            if card.ability.extra.percent > 0 then
                if (card.ability.extra.percent - card.ability.extra.percent_mod) <= 0 then
                    SMODS.scale_card(card, {
	                    ref_table = card.ability.extra,
                        ref_value = "percent",
	                    scalar_value = "percent_mod",
                        operation = '-',
                        scaling_message = {
	                        message = localize('k_eaten_ex'),
                            colour = G.C.RED
                        }
                    })
                else
                    SMODS.scale_card(card, {
	                    ref_table = card.ability.extra,
                        ref_value = "percent",
	                    scalar_value = "percent_mod",
                        operation = '-',
                        scaling_message = {
	                        message = "-"..card.ability.extra.percent_mod.."%",
	                        colour = G.C.FILTER
                        }
                    })
                end
                if card.ability.extra.percent <= 0 then
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
            -- balance_percent(context.blueprint_card or card ,(card.ability.extra.percent*0.01))
            return {
                aij_balance_percent = card.ability.extra.percent * 0.01
            }
        end
    end,
    in_pool = function(self, args)
        if G.GAME then
            if G.GAME.selected_back.effect.center.key ~= 'b_plasma' then
                return true
            end
        end
        return false
    end,
  
}
return { name = {"Jokers"}, items = {candy_floss} }
