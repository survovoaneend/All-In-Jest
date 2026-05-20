local a_v_g_m = {
    object_type = "Joker",
    order = 630,

    key = "a_v_g_m",
    config = {
        extra = {
            cost = 1,
            odds = 30
        }
    },
    rarity = 2,
    pos = { x = 22, y = 29},
    atlas = 'joker_atlas',
    cost = 1,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    ignore = true,

    pixel_size = { w = 65, h = 95 },

    all_in_jest = {
        ability_cost = function(self, card)
            return card.ability.extra.cost
        end,

        can_use_ability = function(self, card, context)
            if to_big(G.GAME.dollars) >= to_big(card.ability.extra.cost) then
                return true
            end
        end,

        use_ability = function(self, card)
            if to_big(G.GAME.dollars) >= to_big(card.ability.extra.cost) then
                ease_dollars(-card.ability.extra.cost)
                card_eval_status_text(card, 'dollars', -card.ability.extra.cost)
                if SMODS.pseudorandom_probability(card, 'a_v_g_m', 1, card.ability.extra.odds) then
                    local max = 2
                    local joker, consumable = false, false
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then max = max + 1; joker = true end
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then max = max + 1; consumable = true end
                    local index = pseudorandom('a_v_g_m', 1, max)
                    if index >= 3 then
                        if joker and consumable then
                            local new_index = pseudorandom('a_v_g_m_again', 1, 2)
                            if new_index == 1 then
                                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                G.E_MANAGER:add_event(Event({
                                  func = function()
                                    local card = create_card('Joker', G.jokers)
                                    card:add_to_deck()
                                    G.jokers:emplace(card)
                                    card:start_materialize(nil, i ~= 1)
                                    G.GAME.joker_buffer = 0
                                    return true
                                  end
                                }))
                            else
                                create_consumable("Consumeables")
                            end
                        elseif joker then
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                              func = function()
                                local card = create_card('Joker', G.jokers)
                                card:add_to_deck()
                                G.jokers:emplace(card)
                                card:start_materialize(nil, i ~= 1)
                                G.GAME.joker_buffer = 0
                                return true
                              end
                            }))
                        else
                            create_consumable("Consumeables")
                        end
                    elseif index == 2 then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local new_card = create_playing_card({
                                    front = pseudorandom_element(G.P_CARDS, pseudoseed('a_v_g_m')),
                                    center = G.P_CENTERS.c_base}, card, true, nil, {G.C.SECONDARY_SET.Enhanced}, true)
                                new_card:start_materialize()
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.3,
                                    func = function()
                                        G.deck:emplace(new_card)
                                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                                        return true
                                    end})
                                )
                                playing_card_joker_effects({new_card})
                                return true
                            end})
                        )
                    elseif index == 1 then
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                jest_add_tag(jest_poll_tag("a_v_g_m"))
                                return true
                            end)
                        }))
                    end
                    card:juice_up(0.4, 0.4)
                    play_sound('tarot1')
                end
            end
        end,
    },

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'a_v_g_m')
        return {
            vars = {
                numerator, denominator,
                card.ability.extra.cost,
                colours = {
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,

    update = function(self, card, dt)
        if not card.aij_ability_cost_label or card.config.center.all_in_jest:ability_cost(card) ~= card.aij_ability_cost_label then
            card.aij_ability_cost_label = card.config.center.all_in_jest:ability_cost(card) or "??"
        end
    end,

    calculate = function(self, card, context)

    end
}
return { name = {"Jokers"}, items = {a_v_g_m} }