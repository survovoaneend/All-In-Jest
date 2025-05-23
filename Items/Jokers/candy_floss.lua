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
    eternal_compat = true,
  
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
                card.ability.extra.percent = card.ability.extra.percent - card.ability.extra.percent_mod
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
                    return {
                        message = localize('k_eaten_ex'),
                        colour = G.C.RED
                    }
                else
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = "-5%"})
                end
            end
        end
        if context.joker_main then
            balance_percent(card,(card.ability.extra.percent*0.01))
        end
    end
  
}
return { name = {"Jokers"}, items = {candy_floss} }
