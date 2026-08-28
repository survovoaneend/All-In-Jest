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
            ["Retrograde"] = 0.01, 
            ["Passigrade"] = 0.5, 
            ["Prograde"] = 0.49,
        }
    },
}
local spica_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'spica_pin',
    pin = 'Spica',
    atlas = 'misc_atlas',
	pos = { x = 4, y = 1 },
    discovered = false,
    order = 9,
    config = {},

    pixel_size = { w = 53, h = 28 },

    loc_vars = function(self, info_queue, card)
        local active_text = "("..localize('k_inactive')..")"
        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then 
            active_text = "("..localize('k_active')..")"
        end
		return {
			vars = {
                active_text
			},
		}
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval and G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
            for i, astral in ipairs(G.GAME.Astral_pins[card.ability.extra.hand]) do
                if astral.pin == 'Spica' then
                    table.remove(G.GAME.Astral_pins[card.ability.extra.hand], i)
                    break
                end
            end
            G.GAME.blind:disable()
            play_sound('timpani')
            delay(0.4)
            return {
                message = localize('ph_boss_disabled')
            }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        local eval = function()
            return G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled
        end
        juice_card_until(card, eval, true)
    end
}
return {name = {"Astrals"}, items = {spica, spica_pin}}