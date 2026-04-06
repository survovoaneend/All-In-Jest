local capella = {
    object_type = "Consumable",
	key = 'capella',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 9, y = 3 },
    soul_pos = { x = 9, y = 4 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 3,
	config = { hand = nil, grade = '', pin = 'Capella', extra = {odds = 2}},
    loc_vars = function(self, info_queue, card)
        card.ability.consumeable.hand = All_in_Jest.astral_hand_from_grade(card.ability.consumeable.grade, card.ability.consumeable.hand)
        if card.ability.consumeable.hand then
            info_queue[#info_queue+1] = {key = 'aij_astral_'..string.lower(card.ability.consumeable.grade), set = 'Other'}
        end
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
		return {
			vars = {
				card.ability.consumeable.hand or '(hand)',
                numerator, denominator,
			},
		}
    end,
    all_in_jest = {
        grades = {
            ["Retrograde"] = 0.3, 
            ["Passigrade"] = 0.6, 
            ["Prograde"] = 0.1,
        }
    },
}
local capella_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'capella',
    pin = 'Capella',
    atlas = 'misc_atlas',
    pos = { x = 0, y = -1 },
	soul_pos = { x = 1, y = 0 },
    discovered = false,
    order = 3,
    config = {},

    pixel_size = { w = 53, h = 28 },

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
		return {
			vars = {
				card.ability.extra.hand,
                numerator, denominator,
			},
		}
    end,

    calculate = function(self, card, context)
        if context.after and not context.repetition then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    SMODS.destroy_cards(card, true, true, true)
                    return true
            end}))
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if SMODS.pseudorandom_probability(card, 'capella', 1, card.ability.extra.odds) then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    return {
                        focus = card,
                        message = localize('k_plus_planet'),
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
                                    local cardd = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'zanni')
                                    cardd:add_to_deck()
                                    G.consumeables:emplace(cardd)
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end)
                            }))
                        end,
                        colour = G.C.SECONDARY_SET.Planet,
                        card = card
                    }
                else
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_nope_ex'), colour = G.C.SECONDARY_SET.Tarot})
                    return true end }))
                end
            else
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_nope_ex'), colour = G.C.SECONDARY_SET.Tarot})
                return true end }))
            end
        end
    end,
}
return {name = {"Astrals"}, items = {capella, capella_pin}}