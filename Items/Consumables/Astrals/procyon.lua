local procyon = {
    object_type = "Consumable",
	key = 'procyon',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 8, y = 5 },
    soul_pos = { x = 8, y = 6 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 5,
	config = { hand = nil, grade = '', pin = 'Procyon', extra = {sell_val = 3}},
    loc_vars = function(self, info_queue, card)
        card.ability.consumeable.hand = All_in_Jest.astral_hand_from_grade(card.ability.consumeable.grade, card.ability.consumeable.hand)
        if card.ability.consumeable.hand then
            info_queue[#info_queue+1] = {key = 'aij_astral_'..string.lower(card.ability.consumeable.grade), set = 'Other'}
        end
		return {
			vars = {
				card.ability.consumeable.hand or '(hand)',
                card.ability.extra.sell_val,
			},
		}
    end,
    add_to_deck = function(self, card, from_debuff)
        if card.ability.consumeable.grade == '' then
            local grade = All_in_Jest.astral_set_grade()
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
local procyon_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'procyon',
    pin = 'Procyon',
    atlas = 'misc_atlas',
    pos = { x = 0, y = -1 },
	soul_pos = { x = 0, y = 1 },
    discovered = false,
    order = 5,
    config = {},

    pixel_size = { w = 48, h = 42 },

    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.hand,
                card.ability.extra.sell_val,
			},
		}
    end,

    calculate = function(self, card, context)
        if context.after and not context.repetition then
            if #G.jokers.cards > 0 then
                local joker = pseudorandom_element(G.jokers.cards, pseudoseed('procyon'))
                joker.ability.extra_value = joker.ability.extra_value + card.ability.extra.sell_val --Not sure if this should use scale_card
                card_eval_status_text(joker, "extra", nil, nil, nil, {message = localize('k_val_up'), colour = G.C.MONEY})
                joker:set_cost()
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    card:juice_up(0.3, 0.5)
                return true end }))
            else
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_nope_ex'), colour = G.C.SECONDARY_SET.Tarot})
                return true end }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    SMODS.destroy_cards(card, true, true, true)
                    return true
            end}))
        end
    end,
}
return {name = {"Astrals"}, items = {procyon, procyon_pin}}