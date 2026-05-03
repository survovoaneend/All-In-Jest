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
		return {
			vars = {
				(card.area and not card.area.config.collection) and card.ability.consumeable.hand or '(hand)',
                card.ability.extra.percent
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
	pos = { x = 4, y = 0 },
    discovered = false,
    order = 2,
    config = {},

    pixel_size = { w = 53, h = 34 }, --This is off because it makes the sprite smaller if it was accurate

    loc_vars = function(self, info_queue, card)
        local pin_count = 0
        if G.GAME.Astral_pins and #G.GAME.Astral_pins and card.ability.consumeable and card.ability.consumeable.hand then 
            pin_count = #G.GAME.Astral_pins[card.ability.consumeable.hand] or 0 
        end
		return {
			vars = {
				card.ability.extra.hand,
                card.ability.extra.percent
			},
		}
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                aij_balance_percent = card.ability.extra.percent * 0.01
            }
        end
    end,
}
return {name = {"Astrals"}, items = {aldebaran, aldebaran_pin}}