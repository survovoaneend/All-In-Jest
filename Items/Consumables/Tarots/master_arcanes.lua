local master_arcanes = {
	object_type = "Consumable",
	key = 'master_arcanes',
	set = 'Tarot',

	pos = { x = 4, y = 6 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 4,
	config = {
		extra = {
			odds = 2
		}
	},
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		return {
            vars = {
                SMODS.get_probability_vars(card, G.GAME.probabilities.normal or 1, card.ability.extra.odds)
            }
        }
	end,
	can_use = function(self, card, area, copier)
		if #G.consumeables.cards <= G.consumeables.config.card_limit or self.area == G.consumeables then
			return true
		end
	end,
	use = function(self, card)
		if SMODS.pseudorandom_probability(card, 'master_arcanes', G.GAME.probabilities.normal or 1, card.ability.extra.odds) then
			create_consumable("Spectral", nil, nil, nil)
		else
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.4,
				func = function()
					local booster = G.STATE == G.STATES.TAROT_PACK
						or G.STATE == G.STATES.SPECTRAL_PACK
						or G.STATE == G.STATES.SMODS_BOOSTER_OPENED

					attention_text({
						text = localize('k_nope_ex'),
						scale = 1.3,
						hold = 1.4,
						major = card,
						backdrop_colour = color or G.C.SECONDARY_SET.Tarot,
						align = booster and 'tm' or 'cm',
						offset = {
							x = 0,
							y = booster and -0.2 or 0
						},
						silent = true
					})

					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0.06 * G.SETTINGS.GAMESPEED,
						blockable = false,
						blocking = false,
						func = function()
							play_sound('tarot2', 0.76, 0.4)
							return true
						end
					}))

					play_sound('tarot2', 1, 0.4)
					card:juice_up(0.3, 0.5)
					return true
				end
			}))
		end
	end,
}
return { name = { "Tarots" }, items = { master_arcanes } }
