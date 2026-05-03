local spica = {
    object_type = "Consumable",
	key = 'spica',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 12, y = 5 },
    soul_pos = { x = 12, y = 6 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 9,
	config = { hand = nil, grade = '', pin = 'Spica', extra = {}},
    loc_vars = function(self, info_queue, card)
        -- Rest of loc_vars is defined in the ConsumableType in hooks.lua
		return {
			vars = {
				(card.area and not card.area.config.collection) and card.ability.consumeable.hand or '(hand)'
			},
		}
    end,
    all_in_jest = {
        grades = {
            ["Retrograde"] = 0.1, 
            ["Passigrade"] = 0.6, 
            ["Prograde"] = 0.3,
        }
    },
}
local spica_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'spica',
    pin = 'Spica',
    atlas = 'misc_atlas',
	pos = { x = 4, y = 1 },
    discovered = false,
    order = 9,
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
        if context.before and context.main_eval and G.GAME.blind and G.GAME.blind.boss and G.GAME.current_round.hands_played == 0 then
            G.GAME.blind:disable()
            play_sound('timpani')
            return {message = localize('ph_boss_disabled')}
        end
    end,
}
return {name = {"Astrals"}, items = {spica, spica_pin}}