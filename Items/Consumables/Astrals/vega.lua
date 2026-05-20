local vega = {
    object_type = "Consumable",
	key = 'vega',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 16, y = 5 },
    soul_pos = { x = 16, y = 6 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 13,
	config = { hand = nil, grade = '', pin = 'Vega', extra = {}},
    loc_vars = function(self, info_queue, card)
        -- Rest of loc_vars is defined in the ConsumableType in hooks.lua
		return {
			vars = {
				(card.area and not card.area.config.collection) and card.ability.consumeable.hand or '(hand)'
			},
		}
    end,
}
local vega_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'vega_pin',
    pin = 'Vega',
    atlas = 'misc_atlas',
	pos = { x = 8, y = 1 },
    discovered = false,
    order = 13,
    config = {},

    pixel_size = { w = 53, h = 28 },

    loc_vars = function(self, info_queue, card)
        
		return {
			vars = {
				card.ability.extra.hand
			},
		}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.hand then
            return {
                message = localize('k_again_ex'),
                repetitions = 1,
                card = card
            }
        end
    end,
}
return {name = {"Astrals"}, items = {vega, vega_pin}}