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
        card.ability.consumeable.hand = All_in_Jest.astral_hand_from_grade(card.ability.consumeable.grade, card.ability.consumeable.hand)
        if card.ability.consumeable.hand then
            info_queue[#info_queue+1] = {key = 'aij_astral_'..string.lower(card.ability.consumeable.grade), set = 'Other'}
        end
		return {
			vars = {
				card.ability.consumeable.hand or '(hand)',
                card.ability.extra.draw_amt,
			},
		}
    end,
    add_to_deck = function(self, card, from_debuff)
        if card.ability.consumeable.grade == '' then
            local grade = All_in_Jest.astral_set_grade({["Retrograde"] = 0.3, ["Passigrade"] = 0.5, ["Prograde"] = 0.2})
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
    config = {},

    pixel_size = { w = 53, h = 28 },

    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.hand,
                card.ability.extra.draw_amt,
			},
		}
    end,

    calculate = function(self, card, context)
        if context.drawing_cards then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    SMODS.destroy_cards(card, true, true, true)
                    return true
            end}))
            return {
                cards_to_draw = context.amount + card.ability.extra.draw_amt,
                message = "+" .. card.ability.extra.draw_amt
            }
        end
        if context.end_of_round and not context.blueprint and context.main_eval then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    SMODS.destroy_cards(card, true, true, true)
                    return true
            end}))
        end
    end,
}
return {name = {"Astrals"}, items = {alcyone, alcyone_pin}}