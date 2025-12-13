local sirius = {
    object_type = "Consumable",
	key = 'sirius',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 8, y = 3 },
    soul_pos = { x = 8, y = 4 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 4,
	config = { hand = nil, grade = '', pin = 'Sirius', extra = {cards = 1}},
    loc_vars = function(self, info_queue, card)
        card.ability.consumeable.hand = All_in_Jest.astral_hand_from_grade(card.ability.consumeable.grade, card.ability.consumeable.hand)
        if card.ability.consumeable.hand then
            info_queue[#info_queue+1] = {key = 'aij_astral_'..string.lower(card.ability.consumeable.grade), set = 'Other'}
        end
		return {
			vars = {
				card.ability.consumeable.hand or '(hand)',
                card.ability.extra.cards,
			},
		}
    end,
    add_to_deck = function(self, card, from_debuff)
        if card.ability.consumeable.grade == '' then
            local grade = All_in_Jest.astral_set_grade({["Retrograde"] = 0.15, ["Passigrade"] = 0.55, ["Prograde"] = 0.3})
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
        All_in_Jest.create_astral_pin(card)
    end,
}
local sirius_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'sirius',
    pin = 'Sirius',
    atlas = 'misc_atlas',
    pos = { x = 0, y = -1 },
	soul_pos = { x = 0, y = 0 },
    discovered = false,
    order = 4,
    config = {},

    pixel_size = { w = 53, h = 28 },

    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.hand,
                card.ability.extra.cards,
			},
		}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card then
                if not card.ability.extra.random_cards then
                    card.ability.extra.random_cards = {}
                    for i = 1, card.ability.extra.cards do
                        card.ability.extra.random_cards[#card.ability.extra.random_cards+1] = pseudorandom_element(context.scoring_hand, pseudoseed('sirius'))
                    end
                end
                local retriggers = 0
                for k, v in pairs(card.ability.extra.random_cards) do
                    if context.other_card == v then
                        retriggers = retriggers + 1
                    end
                end
                if retriggers > 0 then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = retriggers,
                        card = context.other_card
                    }
                end
            end
        end
        if context.after and not context.repetition then
            card.ability.extra.random_cards = nil
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    SMODS.destroy_cards(card, true, true, true)
                    return true
            end}))
        end
    end,
}
return {name = {"Astrals"}, items = {sirius, sirius_pin}}