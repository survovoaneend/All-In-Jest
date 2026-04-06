local algol = {
    object_type = "Consumable",
	key = 'algol',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 10, y = 3 },
    soul_pos = { x = 10, y = 4 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 0,
	config = { hand = nil, grade = '', pin = 'Algol', extra = {dollars = 2}},
    loc_vars = function(self, info_queue, card)
        card.ability.consumeable.hand = All_in_Jest.astral_hand_from_grade(card.ability.consumeable.grade, card.ability.consumeable.hand)
        if card.ability.consumeable.hand then
            info_queue[#info_queue+1] = {key = 'aij_astral_'..string.lower(card.ability.consumeable.grade), set = 'Other'}
        end
		return {
			vars = {
				card.ability.consumeable.hand or '(hand)',
                card.ability.extra.dollars
			},
		}
    end,
    all_in_jest = {
        grades = {
            ["Retrograde"] = 0.6, 
            ["Passigrade"] = 0.3, 
            ["Prograde"] = 0.1,
        }
    }
}
local algol_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'algol',
    pin = 'Algol',
    atlas = 'misc_atlas',
    pos = { x = 0, y = -1 },
	soul_pos = { x = 2, y = 0 },
    discovered = false,
    order = 0,
    config = {},

    pixel_size = { w = 53, h = 28 },

    loc_vars = function(self, info_queue, card)
        return {
		    vars = {
			    card.ability.extra.hand,
                card.ability.extra.dollars,
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
            return { 
                dollars = card.ability.extra.dollars,
                card = card 
            }
        end
    end,
}
return {name = {"Astrals"}, items = {algol, algol_pin}}