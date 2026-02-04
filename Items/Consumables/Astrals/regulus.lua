local regulus = {
    object_type = "Consumable",
	key = 'regulus',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 9, y = 5 },
    soul_pos = { x = 9, y = 6 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 5,
	config = { hand = nil, grade = '', pin = 'Regulus', extra = {odds = 6}},
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
            ["Retrograde"] = 0.4, 
            ["Passigrade"] = 0.4, 
            ["Prograde"] = 0.2,
        }
    },
}
local regulus_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'regulus',
    pin = 'Regulus',
    atlas = 'misc_atlas',
    pos = { x = 0, y = -1 },
	soul_pos = { x = 1, y = 1 },
    discovered = false,
    order = 6,
    config = {},

    pixel_size = { w = 48, h = 42 },

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
        end
        if context.before and context.main_eval then    
            if SMODS.pseudorandom_probability(card, 'regulus', 1, card.ability.extra.odds) then
                return {
                    level_up = 1,
                    level_up_hand = card.ability.extra.hand,
                    message = localize('k_level_up_ex')
                }
            end
        end
    end,
}
return {name = {"Astrals"}, items = {regulus, regulus_pin}}