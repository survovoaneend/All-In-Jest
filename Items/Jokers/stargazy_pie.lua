local stargazy_pie = {
    object_type = "Joker",
    order = 305,
    key = "stargazy_pie",
    config = {
        extra = { triggers = 5 }
    },
    rarity = 1,
    pos = { x = 2, y = 12},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    pools = {
        Food = true
    },
  
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.triggers}}
    end,
  
    calculate = function(self, card, context)
        if context.using_consumeable and not context.aij_stargazy_pie then
            if context.consumeable.ability.set == 'Planet' and card.ability.extra.triggers >= 1 then
                -- Doing calculate "early" to maintain intuitive order of animations
                SMODS.calculate_context({using_consumeable = true, consumeable = context.consumeable, area = context.from_area, aij_stargazy_pie = true})

                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_again_ex'), colour = G.C.FILTER})
                context.consumeable:use_consumeable(context.area)
                if not context.blueprint then
                    card.ability.extra.triggers = card.ability.extra.triggers - 1
                    if card.ability.extra.triggers == 0 then
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
                                        return true; end}))
                                return true
                            end
                        }))
                        card.ability.extra.triggers = 1
                        return {
                            message = localize('k_eaten_ex'),
                        }
                    end
                end
            end
        end
    end
}
return { name = {"Jokers"}, items = {stargazy_pie} }
