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
        -- Rest of loc_vars is defined in the ConsumableType in hooks.lua
		return {
			vars = {
				(card.area and not card.area.config.collection) and card.ability.consumeable.hand or '(hand)',
                card.ability.extra.sell_val
			},
		}
    end,
    all_in_jest = {
        grades = {
            ["Retrograde"] = 0.5, 
            ["Passigrade"] = 0.4, 
            ["Prograde"] = 0.1,
        }
    },
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
        local pin_count = 0
        if G.GAME.Astral_pins and #G.GAME.Astral_pins and card.ability.consumeable and card.ability.consumeable.hand then 
            pin_count = #G.GAME.Astral_pins[card.ability.consumeable.hand] or 0 
        end
		return {
			vars = {
				card.ability.extra.hand,
                card.ability.extra.sell_val
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
        end
    end,
}
return {name = {"Astrals"}, items = {procyon, procyon_pin}}