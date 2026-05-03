local deneb_algedi = {
    object_type = "Consumable",
	key = 'deneb_algedi',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 17, y = 5 },
    soul_pos = { x = 17, y = 6 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 14,
	config = { hand = nil, grade = '', pin = 'Deneb Algedi', extra = {hands = 1}},
    loc_vars = function(self, info_queue, card)
        -- Rest of loc_vars is defined in the ConsumableType in hooks.lua
		return {
			vars = {
				(card.area and not card.area.config.collection) and card.ability.consumeable.hand or '(hand)',
                card.ability.extra.hands
			},
		}
    end,
    all_in_jest = {
        grades = {
            ["Retrograde"] = 0.3, 
            ["Passigrade"] = 0.6, 
            ["Prograde"] = 0.1,
        }
    },
}
local deneb_algedi_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'deneb_algedi',
    pin = 'Deneb Algedi',
    atlas = 'misc_atlas',
	pos = { x = 8, y = 1 },
    discovered = false,
    order = 14,
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
                card.ability.extra.hands
			},
		}
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval then
            local trigger = true
            if G.GAME.all_in_jest and G.GAME.all_in_jest.advanced_hand_usage_blind then
                for _, v in pairs(G.GAME.all_in_jest.advanced_hand_usage_blind) do
                    if v.scoring_name == card.ability.extra.hand then
                        trigger = false
                    end
                end
            end
            if trigger then
                ease_hands_played(card.ability.extra.hands)
            end
        end
    end,
}
return {name = {"Astrals"}, items = {deneb_algedi, deneb_algedi_pin}}