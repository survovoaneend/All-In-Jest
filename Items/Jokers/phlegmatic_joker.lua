local phlegmatic_joker = {
    object_type = "Joker",
    order = 351,

    key = "phlegmatic_joker",
    config = {
        extra = {
            odds = 4
        }
    },
    rarity = 3,
    pos = { x = 21, y = 13 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit("Clubs") and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if pseudorandom('phlegmatic_joker') < G.GAME.probabilities.normal / card.ability.extra.odds then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1


                    local hand_played = context.scoring_name
                    local planet_to_spawn_key = nil


                    if hand_played then
                        for _, planet_data in ipairs(G.P_CENTER_POOLS.Planet) do
                            if planet_data.config.hand_type == hand_played and not planet_data.config.moon then
                                planet_to_spawn_key = planet_data.key
                                break
                            end
                        end
                    end

                    if planet_to_spawn_key then
                        return {
                            focus = card,
                            message = localize('k_plus_planet'),
                            colour = G.C.SECONDARY_SET.Planet,
                            card = card,
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'before',
                                    delay = 0.0,
                                    func = (function()
                                        local new_planet_card = create_card('Planet', G.consumeables, nil, nil, true,
                                            true, planet_to_spawn_key, 'phleg')
                                        new_planet_card:add_to_deck()
                                        G.consumeables:emplace(new_planet_card)
                                        G.GAME.consumeable_buffer = 0
                                        return true
                                    end)
                                }))
                            end
                        }
                    else
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
                    end
                end
            end
        end
    end

}
return { name = { "Jokers" }, items = { phlegmatic_joker } }
