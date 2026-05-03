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
        -- Rest of loc_vars is defined in the ConsumableType in hooks.lua
		return {
			vars = {
				(card.area and not card.area.config.collection) and card.ability.consumeable.hand or '(hand)',
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
        local pin_count = 0
        if G.GAME.Astral_pins and #G.GAME.Astral_pins and card.ability.consumeable and card.ability.consumeable.hand then 
            pin_count = #G.GAME.Astral_pins[card.ability.consumeable.hand] or 0 
        end
        return {
		    vars = {
			    card.ability.extra.hand,
                card.ability.extra.dollars
		    },
        }
    end,

    calculate = function(self, card, context)
        if context.after and not context.repetition then
            return { 
                dollars = card.ability.extra.dollars,
                card = card 
            }
        end
    end,
}
return {name = {"Astrals"}, items = {algol, algol_pin}}