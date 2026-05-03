local antares = {
    object_type = "Consumable",
	key = 'antares',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 15, y = 5 },
    soul_pos = { x = 15, y = 6 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 12,
	config = { hand = nil, grade = '', pin = 'Antares', extra = {}},
    loc_vars = function(self, info_queue, card)
        -- Rest of loc_vars is defined in the ConsumableType in hooks.lua
		return {
			vars = {
				(card.area and not card.area.config.collection) and card.ability.consumeable.hand or '(hand)'
			},
		}
    end,
}
local antares_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'antares',
    pin = 'Antares',
    atlas = 'misc_atlas',
	pos = { x = 7, y = 1 },
    discovered = false,
    order = 12,
    config = {},

    pixel_size = { w = 53, h = 28 },

    loc_vars = function(self, info_queue, card)
        local pin_count = 0
        if G.GAME.Astral_pins and #G.GAME.Astral_pins and card.ability.consumeable and card.ability.consumeable.hand then 
            pin_count = #G.GAME.Astral_pins[card.ability.consumeable.hand] or 0 
        end
		return {
			vars = {
				card.ability.extra.hand
			},
		}
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval and (G.hand and G.hand.cards and #G.hand.cards > 0) then
            local o_card = pseudorandom_element(G.hand.cards, pseudoseed('jest_antares'))
            local total_cards = {}
            if not o_card.destroyed then
                table.insert(total_cards, o_card)
            end
            SMODS.destroy_cards(total_cards)
        end
    end,
}
return {name = {"Astrals"}, items = {antares, antares_pin}}