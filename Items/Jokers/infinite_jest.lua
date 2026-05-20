local infinite_jest = {
    object_type = "Joker",
    order = 14,

    key = "infinite_jest",
    config = {

    },
    rarity = 3,
    pos = { x = 13, y = 0 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    lite = true,

    loc_vars = function(self, info_queue, card)

    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.beat_boss and context.main_eval then
            local eff_card = context.blueprint_card or card
            G.E_MANAGER:add_event(Event({
                func = function()
                    card_eval_status_text(eff_card, 'extra', nil, nil, nil,
                        { message = localize('k_upgrade_ex'), colour = G.C.GREEN })
                    return true
                end
            }))
            --literally just black hole
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                        { handname = localize('k_all_hands'), chips = '...', mult = '...', level = '' })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.2,
                        func = function()
                            play_sound('tarot1')
                            eff_card:juice_up(0.8, 0.5)
                            G.TAROT_INTERRUPT_PULSE = true
                            return true
                        end
                    }))
                    update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.9,
                        func = function()
                            play_sound('tarot1')
                            eff_card:juice_up(0.8, 0.5)
                            return true
                        end
                    }))
                    update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.9,
                        func = function()
                            play_sound('tarot1')
                            eff_card:juice_up(0.8, 0.5)
                            G.TAROT_INTERRUPT_PULSE = nil
                            return true
                        end
                    }))
                    update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+1' })
                    delay(1.3)
                    for k, v in pairs(G.GAME.hands) do
                        level_up_hand(eff_card, k, true)
                    end
                    update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
                        { mult = 0, chips = 0, handname = '', level = '' })
                    return true
                end
            }))

            return nil, true
        end
    end

}
return { name = { "Jokers" }, items = { infinite_jest } }
