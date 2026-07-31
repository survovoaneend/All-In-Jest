local monarchic_joker = {
    object_type = "Joker",
    order = 351.5,
    
    key = "monarchic_joker",
    config = {
        extra = {
            odds = 5
        }
    },
    attributes = { 'generation', 'minor_arcana', 'consumable', 'suit', 'crowns', 'chance' },
    rarity = 3,
    pos = { x = 16, y = 16},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    jest_rec_paperback = true,
    ignore = true,
  
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
            if context.other_card:is_suit("paperback_Crowns") and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if SMODS.pseudorandom_probability(card, 'monarchic_joker', 1, card.ability.extra.odds) then
                    local juiced_card = context.blueprint_card or card
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    return {
                        focus = juiced_card,
                        message = localize('paperback_plus_minor_arcana'),
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
                                    local cardd = create_card('paperback_minor_arcana', G.consumeables, nil, nil, nil, nil, nil, 'mona')
                                    cardd:add_to_deck()
                                    G.consumeables:emplace(cardd)
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end)
                            }))
                        end,
                        colour = G.C.SECONDARY_SET.Spectral,
                        card = juiced_card
                    }
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {monarchic_joker} }
