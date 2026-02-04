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
	config = { hand = nil, grade = '', pin = 'Algorab', extra = {odds = 6}},
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
    add_to_deck = function(self, card, from_debuff)
        if card.ability.consumeable.grade == '' then
            local grade = All_in_Jest.astral_set_grade({["Retrograde"] = 0.3, ["Passigrade"] = 0.6, ["Prograde"] = 0.1})
            card.ability.consumeable.grade = grade
            card.ability.consumeable.hand = All_in_Jest.astral_hand_from_grade(grade)
        end
    end,
    can_use = function(self, card)
        if G.Astral_pins[card.ability.consumeable.hand] and #G.Astral_pins[card.ability.consumeable.hand] < G.GAME.all_in_jest.astral_pin_per_hand then
            return true 
        end
    end,
	use = function(self, card, area, copier)
        All_in_Jest.use_astral_card(card)
    end,
}
local algorab_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'algorab',
    pin = 'Algorab',
    atlas = 'misc_atlas',
    pos = { x = 0, y = -1 },
	soul_pos = { x = 3, y = 1 },
    discovered = false,
    order = 8,
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
return {name = {"Astrals"}, items = {algorab, algorab_pin}}