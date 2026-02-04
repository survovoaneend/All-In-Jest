local aldebaran = {
    object_type = "Consumable",
	key = 'aldebaran',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 12, y = 3 },
    soul_pos = { x = 12, y = 4 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 2,
	config = { hand = nil, grade = '', pin = 'Aldebaran', extra = {percent = 10}},
    loc_vars = function(self, info_queue, card)
        card.ability.consumeable.hand = All_in_Jest.astral_hand_from_grade(card.ability.consumeable.grade, card.ability.consumeable.hand)
        if card.ability.consumeable.hand then
            info_queue[#info_queue+1] = {key = 'aij_astral_'..string.lower(card.ability.consumeable.grade), set = 'Other'}
        end
		return {
			vars = {
				card.ability.consumeable.hand or '(hand)',
                card.ability.extra.percent,
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
        if G.Astral_pins[card.ability.consumeable.hand] and #G.Astral_pins[card.ability.consumeable.hand] < G.GAME.all_in_jest.astral_pin_per_hand then
            return true 
        end
    end,
	use = function(self, card, area, copier)
        All_in_Jest.use_astral_card(card)
    end,
}
local aldebaran_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'aldebaran',
    pin = 'Aldebaran',
    atlas = 'misc_atlas',
    pos = { x = 0, y = -1 },
	soul_pos = { x = 4, y = 0 },
    discovered = false,
    order = 2,
    config = {},

    pixel_size = { w = 53, h = 34 }, --This is off because it makes the sprite smaller if it was accurate

    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.hand,
                card.ability.extra.percent,
			},
		}
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    SMODS.destroy_cards(card, true, true, true)
                    return true
            end}))
            return {
                aij_balance_percent = card.ability.extra.percent * 0.01
            }
        end
    end,
}
return {name = {"Astrals"}, items = {aldebaran, aldebaran_pin}}