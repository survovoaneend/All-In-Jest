local rahu = {
    object_type = "Consumable",
	key = 'rahu',
	set = 'Spectral',
    atlas = 'consumable_atlas',
	pos = { x = 14, y = 3 },
    soul_pos = { x = 14, y = 4 },
	cost = 4,
    hidden = true,
    ignore = true,
    soul_rate = 0.003,
    soul_set = 'aij_astral',
	unlocked = true,
	discovered = false,
    order = 19,
	config = { hand = nil, grade = '', pin = 'Rahu', extra = {}},
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
    all_in_jest = {
        as_astral = true
    },
    add_to_deck = function(self, card, from_debuff)
        if card.ability.consumeable.grade == '' then
            local center = card.config.center
            local grade = All_in_Jest.astral_set_grade(center.all_in_jest and center.all_in_jest.grades)
            card.ability.consumeable.grade = grade
            card.ability.consumeable.hand = All_in_Jest.astral_hand_from_grade(grade)
        end
    end,
    can_use = function(self, card)
        return true 
    end,
    use = function(self, card, area, copier)
        All_in_Jest.use_astral_card(card)
    end,
}
local rahu_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'rahu',
    pin = 'Rahu',
    alt_set = "Spectral",
    atlas = 'misc_atlas',
    pos = { x = 0, y = -1 },
	soul_pos = { x = 6, y = 0 },
    discovered = false,
    order = 19,
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
        if context.repetition and context.cardarea == G.play then
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
return {name = {"Astrals", "Spectrals"}, items = {rahu, rahu_pin}}