local introverted = {
	object_type = "Sticker",
	key = "introverted",
	config = { extra = {} },
	atlas = "stickers_atlas",
	order = 2,
	pos = { x = 2, y = 1 },
	badge_colour = HEX("d56f7e"),
	loc_vars = function(self, info_queue, card)
		return { vars = {} }
	end,
	sets = { Joker = true },
	eternal_compat = false,
	perishable_compat = false,
	rate = 0.3,
	calculate = function(self, card, context)
		if context.setting_blind and not card.getting_sliced and (#G.jokers.cards + G.GAME.joker_buffer) >= G.jokers.config.card_limit then
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.joker_buffer = 0
				return true
			end}))
			SMODS.destroy_cards(card, nil, nil, true)
			return {
				message = localize('k_aij_destroyed_ex'),
				message_colour = G.C.RED
			}
		end
	end,
}
SMODS.Stickers["eternal"].aij_introverted_compat = false
SMODS.Stickers["perishable"].aij_introverted_compat = false
return { name = { "Stickers" }, items = { introverted } }
