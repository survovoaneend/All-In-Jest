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
        -- Rest of loc_vars is defined in the ConsumableType in hooks.lua
		return {
			vars = {
				(card.area and not card.area.config.collection) and card.ability.consumeable.hand or '(hand)',
                card.ability.extra.cards
			},
		}
    end,
    all_in_jest = {
        grades = {
            ["Retrograde"] = 0.15, 
            ["Passigrade"] = 0.55, 
            ["Prograde"] = 0.3,
        }
    },
}
local sirius_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'sirius',
    pin = 'Sirius',
    atlas = 'misc_atlas',
	pos = { x = 0, y = 0 },
    discovered = false,
    order = 4,
    config = {},

    pixel_size = { w = 53, h = 28 },

    loc_vars = function(self, info_queue, card)
        local pin_count = 0
        if G.GAME.Astral_pins and #G.GAME.Astral_pins and card.ability.consumeable and card.ability.consumeable.hand then 
            pin_count = #G.GAME.Astral_pins[card.ability.consumeable.hand] or 0 
        end
		return {
			vars = {
				card.ability.extra.hand,
                card.ability.extra.cards
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
        end
    end,
}
return {name = {"Astrals"}, items = {sirius, sirius_pin}}