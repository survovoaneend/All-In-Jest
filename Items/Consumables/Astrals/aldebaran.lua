local aldebaran = {
    object_type = "Consumable",
	key = 'aldebaran',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 12, y = 3 },
    soul_pos = { x = 12, y = 4 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 2,
	config = { hand = nil, grade = '', pin = 'Aldebaran', extra = {percent = 10}},
    loc_vars = function(self, info_queue, card)
        card.ability.consumeable.hand = All_in_Jest.astral_hand_from_grade(card.ability.consumeable.grade, card.ability.consumeable.hand)
        if card.ability.consumeable.hand then
            info_queue[#info_queue+1] = {key = 'aij_astral_'..string.lower(card.ability.consumeable.grade), set = 'Other'}
        end
		return {
			vars = {
				card.ability.consumeable.hand or '(hand)',
                card.ability.extra.percent,
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
local aldebaran_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'aldebaran',
    pin = 'Aldebaran',
    atlas = 'misc_atlas',
    pos = { x = 0, y = -1 },
	soul_pos = { x = 4, y = 0 },
    discovered = false,
    order = 2,
    config = {},

    pixel_size = { w = 53, h = 34 }, --This is off because it makes the sprite smaller if it was accurate

    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.hand,
                card.ability.extra.percent,
			},
		}
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    SMODS.destroy_cards(card, true, true, true)
                    return true
            end}))
            return {
                aij_balance_percent = card.ability.extra.percent * 0.01
            }
        end
    end,
}
return {name = {"Astrals"}, items = {aldebaran, aldebaran_pin}}