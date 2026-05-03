local algorab = {
    object_type = "Consumable",
	key = 'algorab',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 11, y = 5 },
    soul_pos = { x = 11, y = 6 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 8,
	config = { hand = nil, grade = '', pin = 'Algorab', extra = {odds = 4}},
    loc_vars = function(self, info_queue, card)
        -- Rest of loc_vars is defined in the ConsumableType in hooks.lua
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
		return {
			vars = {
				(card.area and not card.area.config.collection) and card.ability.consumeable.hand or '(hand)',
                numerator, denominator
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
local algorab_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'algorab',
    pin = 'Algorab',
    atlas = 'misc_atlas',
	pos = { x = 3, y = 1 },
    discovered = false,
    order = 8,
    config = {},

    pixel_size = { w = 53, h = 28 },

    loc_vars = function(self, info_queue, card)
        
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
		return {
			vars = {
				card.ability.extra.hand,
                numerator, denominator
			},
		}
    end,

    calculate = function(self, card, context)
        if context.after and not context.repetition then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if SMODS.pseudorandom_probability(card, 'capella', 1, card.ability.extra.odds) then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    return {
                        focus = card,
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
                        card = card
                    }
                else
                    return {message = localize('k_nope_ex'), colour = G.C.SECONDARY_SET.Tarot}
                end
            else
                return {message = localize('k_nope_ex'), colour = G.C.SECONDARY_SET.Tarot}
            end
        end
    end,
}
return {name = {"Astrals"}, items = {algorab, algorab_pin}}