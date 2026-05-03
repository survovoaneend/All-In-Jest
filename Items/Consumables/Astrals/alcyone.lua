local alcyone = {
    object_type = "Consumable",
	key = 'alcyone',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 11, y = 3 },
    soul_pos = { x = 11, y = 4 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 1,
	config = { hand = nil, grade = '', pin = 'Alcyone', extra = {draw_amt = 1}},
    loc_vars = function(self, info_queue, card)
        -- Rest of loc_vars is defined in the ConsumableType in hooks.lua
		return {
			vars = {
				(card.area and not card.area.config.collection) and card.ability.consumeable.hand or '(hand)',
                card.ability.extra.draw_amt
			},
		}
    end,
    all_in_jest = {
        grades = {
            ["Retrograde"] = 0.3, 
            ["Passigrade"] = 0.5, 
            ["Prograde"] = 0.2,
        }
    },
}
local alcyone_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'alcyone',
    pin = 'Alcyone',
    atlas = 'misc_atlas',
    pos = { x = 0, y = -1 },
	soul_pos = { x = 3, y = 0 },
    discovered = false,
    order = 1,
    config = {no_auto_destroy = true},

    pixel_size = { w = 53, h = 28 },

    loc_vars = function(self, info_queue, card)
        local pin_count = 0
        if G.GAME.Astral_pins and #G.GAME.Astral_pins and card.ability.consumeable and card.ability.consumeable.hand then 
            pin_count = #G.GAME.Astral_pins[card.ability.consumeable.hand] or 0 
        end
		return {
			vars = {
				card.ability.extra.hand,
                card.ability.extra.draw_amt
			},
		}
    end,

    calculate = function(self, card, context)
        if context.drawing_cards then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    SMODS.destroy_cards(card, true)
                    return true
            end}))
            return {
                cards_to_draw = context.amount + card.ability.extra.draw_amt,
                message = "+" .. card.ability.extra.draw_amt
            }
        end
    end,
}
return {name = {"Astrals"}, items = {alcyone, alcyone_pin}}