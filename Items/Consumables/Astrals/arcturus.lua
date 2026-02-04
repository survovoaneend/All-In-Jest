local arcturus = {
    object_type = "Consumable",
	key = 'arcturus',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 13, y = 5 },
    soul_pos = { x = 13, y = 6 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 10,
	config = { hand = nil, grade = '', pin = 'Arcturus', extra = {discards = 1}},
    loc_vars = function(self, info_queue, card)
        card.ability.consumeable.hand = All_in_Jest.astral_hand_from_grade(card.ability.consumeable.grade, card.ability.consumeable.hand)
        if card.ability.consumeable.hand then
            info_queue[#info_queue+1] = {key = 'aij_astral_'..string.lower(card.ability.consumeable.grade), set = 'Other'}
        end
		return {
			vars = {
				card.ability.consumeable.hand or '(hand)',
                card.ability.consumeable.extra.discards,
			},
		}
    end,
    add_to_deck = function(self, card, from_debuff)
        if card.ability.consumeable.grade == '' then
            local grade = All_in_Jest.astral_set_grade({["Retrograde"] = 0.4, ["Passigrade"] = 0.4, ["Prograde"] = 0.2})
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
local arcturus_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'arcturus',
    pin = 'Arcturus',
    atlas = 'misc_atlas',
    pos = { x = 0, y = -1 },
	soul_pos = { x = 5, y = 1 },
    discovered = false,
    order = 10,
    config = {},

    pixel_size = { w = 53, h = 28 },

    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.hand,
                card.ability.extra.discards,
			},
		}
    end,

    calculate = function(self, card, context)
        if context.after then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    SMODS.destroy_cards(card, true, true, true)
                    return true
            end}))
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_aij_discards_plus',vars={card.ability.extra.discards}}, colour = G.C.RED})
            ease_discard(card.ability.extra.discards)
        end
    end,
}
return {name = {"Astrals"}, items = {arcturus, arcturus_pin}}