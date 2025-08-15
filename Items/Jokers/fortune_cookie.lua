local fortune_cookie = {
    object_type = "Joker",
    order = 272,
    
    key = "fortune_cookie",
    config = {
      extra = {
        packs_remaining = 5,
        packs = 5
      }
    },
    rarity = 1,
    pos = { x = 20, y = 10},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    pools = {
        Food = true
    },

    pixel_size = { w = 51, h = 95 },
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.packs_remaining,
                card.ability.extra.packs
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.open_booster then 
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                            local cardd = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'for')
                            cardd:add_to_deck()
                            G.consumeables:emplace(cardd)
                            G.GAME.consumeable_buffer = 0
                        return true
                    end)}))
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
            end

            card.ability.extra.packs_remaining = card.ability.extra.packs_remaining - 1
            if card.ability.extra.packs_remaining <= 0 then
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
                card_eval_status_text(card, 'extra', nil, nil, nil, { message = card.ability.extra.packs_remaining.."/"..card.ability.extra.packs, })
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {fortune_cookie} }
