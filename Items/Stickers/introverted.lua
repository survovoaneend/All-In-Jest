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
	rate = 0.3,
	should_apply = function(self, card, center, area, bypass_roll)
		if area == G.shop_jokers or area == G.pack_cards then
			return SMODS.Sticker.should_apply(self, card, center, area, bypass_roll)
		end
		return false
	end,
	calculate = function(self, card, context)
		if
			context.setting_blind
			and not card.getting_sliced
			and (#G.jokers.cards + G.GAME.joker_buffer) >= G.jokers.config.card_limit
		then
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.joker_buffer = 0
					return true
				end,
			}))
			SMODS.destroy_cards(card, nil, nil, true)
			return {
				message = localize("k_aij_destroyed_ex"),
				message_colour = G.C.RED,
			}
		end
	end,
}
local set_eternal_ref = Card.set_eternal
function Card:set_eternal(_eternal)
	if self.ability.aij_introverted then
		self:remove_sticker("aij_introverted")
	end
	set_eternal_ref(self, _eternal)
end
local set_perishable_ref = Card.set_perishable
function Card:set_perishable(_perishable)
	if self.ability.aij_introverted then
		_perishable = false
	end
	set_perishable_ref(self, _perishable)
end
return { name = { "Stickers" }, items = { introverted } }
