local zanni = {
    object_type = "Joker",
    order = 90,

    key = "zanni",
    config = {
      extra = {
        odds = 10
      }
    },
    rarity = 2,
    pos = { x = 10, y = 3 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
            if not context.other_card:is_face() and not context.other_card.no_rank and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if SMODS.pseudorandom_probability(card, 'zanni', 1, card.ability.extra.odds) then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    return {
                        focus = context.blueprint_card or card,
                        message = localize('k_plus_tarot'),
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
                                    local cardd = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'zanni')
                                    cardd:add_to_deck()
                                    G.consumeables:emplace(cardd)
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end)
                            }))
                        end,
                        colour = G.C.SECONDARY_SET.Tarot,
                        card = context.blueprint_card or card
                    }
                end
            end
        end
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            extra = {
                {
                    { text = "(" },
                    { ref_table = "card.joker_display_values", ref_value = "odds" },
                    { text = ")" },
                }
            },
            extra_config = { colour = G.C.GREEN, scale = 0.3 },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                { text = ")" }
            },
            calc_function = function(card)
                local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
                card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { numerator, denominator } }
                card.joker_display_values.localized_text = localize("k_numbered_cards")
            end
        }
    end
  
}
return { name = {"Jokers"}, items = {zanni} }
