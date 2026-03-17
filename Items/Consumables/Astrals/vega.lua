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
local vega_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'vega',
    pin = 'Vega',
    atlas = 'misc_atlas',
    pos = { x = 0, y = -1 },
	soul_pos = { x = 8, y = 1 },
    discovered = false,
    order = 13,
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
        if context.repetition and context.cardarea == G.hand then
            return {
                message = localize('k_again_ex'),
                repetitions = 1,
                card = card
            }
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
return {name = {"Astrals"}, items = {vega, vega_pin}}