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
        card.ability.consumeable.hand = All_in_Jest.astral_hand_from_grade(card.ability.consumeable.grade, card.ability.consumeable.hand)
        if card.ability.consumeable.hand then
            info_queue[#info_queue+1] = {key = 'aij_astral_'..string.lower(card.ability.consumeable.grade), set = 'Other'}
        end
		return {
			vars = {
				card.ability.consumeable.hand or '(hand)',
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
    pos = { x = 0, y = -1 },
	soul_pos = { x = 7, y = 1 },
    discovered = false,
    order = 12,
    config = {},

    pixel_size = { w = 53, h = 28 },

    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.hand,
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
        if context.after then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    SMODS.destroy_cards(card, true, true, true)
                    return true
            end}))
        end
    end,
}
return {name = {"Astrals"}, items = {antares, antares_pin}}