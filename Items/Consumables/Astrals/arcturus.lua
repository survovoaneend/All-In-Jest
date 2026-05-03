local arcturus = {
    object_type = "Consumable",
	key = 'arcturus',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 13, y = 5 },
    soul_pos = { x = 13, y = 6 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 10,
	config = { hand = nil, grade = '', pin = 'Arcturus', extra = {discards = 1}},
    loc_vars = function(self, info_queue, card)
        -- Rest of loc_vars is defined in the ConsumableType in hooks.lua
		return {
			vars = {
				(card.area and not card.area.config.collection) and card.ability.consumeable.hand or '(hand)',
                card.ability.consumeable.extra.discards
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
local arcturus_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'arcturus',
    pin = 'Arcturus',
    atlas = 'misc_atlas',
	pos = { x = 5, y = 1 },
    discovered = false,
    order = 10,
    config = {},

    pixel_size = { w = 53, h = 28 },

    loc_vars = function(self, info_queue, card)
        local pin_count = 0
        if G.GAME.Astral_pins and #G.GAME.Astral_pins and card.ability.consumeable and card.ability.consumeable.hand then 
            pin_count = #G.GAME.Astral_pins[card.ability.consumeable.hand] or 0 
        end
		return {
			vars = {
				card.ability.extra.hand,
                card.ability.extra.discards
			},
		}
    end,

    calculate = function(self, card, context)
        if context.after then
            ease_discard(card.ability.extra.discards)
            return {message = localize{type='variable',key='a_aij_discards_plus',vars={card.ability.extra.discards}}, colour = G.C.RED}
        end
    end,
}
return {name = {"Astrals"}, items = {arcturus, arcturus_pin}}