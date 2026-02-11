local cheese_squigglies = {
    object_type = "Joker",
    order = 486,
    key = "cheese_squigglies",
    
    config = {
        extra = {
            xmult = 1,
            gain = 0.25,
            rolls = 0,
            limit = 10,
        }
    },
    rarity = 2,
    pos = { x = 2, y = 24 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.gain,
                card.ability.extra.rolls,
                card.ability.extra.limit
            }
        }
    end,

    calculate = function(self, card, context)
         if context.reroll_shop and not context.blueprint then
            card.ability.extra.rolls = card.ability.extra.rolls + 1
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain
            
            if card.ability.extra.rolls >= card.ability.extra.limit then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
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
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.RED
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}

return { name = { "Jokers" }, items = { cheese_squigglies } }
