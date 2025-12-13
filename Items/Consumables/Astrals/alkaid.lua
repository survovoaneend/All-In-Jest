local alkaid = {
    object_type = "Consumable",
	key = 'alkaid',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 10, y = 5 },
    soul_pos = { x = 10, y = 6 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 7,
	config = { hand = nil, grade = '', pin = 'Alkaid', extra = {cards = 1}},
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
            local grade = All_in_Jest.astral_set_grade({["Retrograde"] = 0.25, ["Passigrade"] = 0.65, ["Prograde"] = 0.1})
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
local alkaid_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'alkaid',
    pin = 'Alkaid',
    atlas = 'misc_atlas',
    pos = { x = 0, y = -1 },
	soul_pos = { x = 2, y = 1 },
    discovered = false,
    order = 7,
    config = {},

    pixel_size = { w = 53, h = 42 },

    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.hand,
                card.ability.extra.cards,
			},
		}
    end,

    calculate = function(self, card, context)
        if context.before and not context.repetition then
            for i = 1, card.ability.extra.cards do
                local valid_cards = {}
                local enhancements = {}
                for i = 1, #context.full_hand do
                    local has_enhancement = false
                    for k, v in pairs(SMODS.get_enhancements(context.scoring_hand[i])) do
                        if enhancements[k] then
                            enhancements[k] = v
                            has_enhancement = true
                        end
                    end
                    if not has_enhancement then
                        valid_cards[#valid_cards+1] = context.full_hand[i]
                    end
                end
                if #context.full_hand == 0 then valid_cards = context.full_hand end
                local cur_card = pseudorandom_element(valid_cards, pseudoseed('alkaid'))
                local all_enhancements = get_current_pool("Enhanced")
                local valid_enhancements = {}

                for _, enhancement in ipairs(all_enhancements) do
                    if not (enhancement == 'm_stone' or enhancement == 'm_aij_canvas' or G.P_CENTERS[enhancement].no_rank) then
                        valid_enhancements[#valid_enhancements + 1] = enhancement
                    end
                end
                local random_enhancement_key = SMODS.poll_enhancement({ guaranteed = true, key_append = 'alkaid'..i, options = valid_enhancements })
                local enhancement_center = {}
                for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                    if v.key == random_enhancement_key then 
                        enhancement_center = v
                    end
                end
                cur_card:set_ability(enhancement_center)
            end
        end
        if context.after and not context.repetition then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    SMODS.destroy_cards(card, true, true, true)
                    return true
            end}))
        end
    end,
}
return {name = {"Astrals"}, items = {alkaid, alkaid_pin}}