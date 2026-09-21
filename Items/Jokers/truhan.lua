local truhan = {
	object_type = "Joker",
	order = 226,
	lite = true,
	key = "truhan",
	config = {
		extra = {
			xmult = 1,
			xmult_mod = 0.1,
		},
	},
	attributes = { "xmult", "scaling", "on_sell", "on_destroy" },
	rarity = 2,
	pos = { x = 9, y = 8 },
	atlas = "joker_atlas",
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.xmult,
				card.ability.extra.xmult_mod,
			},
		}
	end,

	calculate = function(self, card, context)
		if context.selling_card and (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
			local sold_card = context.card
			if sold_card.ability.set == "Joker" then
				SMODS.scale_card(card, {
					ref_table = card.ability.extra,
					ref_value = "xmult",
					scalar_value = "xmult_mod",
					operation = function(ref_table, ref_value, initial, change)
						ref_table[ref_value] = initial
							+ (change * (tonumber(sold_card.ability.jest_held_for) or 0))
					end,
				})
			end
			return nil, true
		end
		if context.aij_after_destroying_cards then
			for _, destroyed_card in ipairs(context.removed) do
				if destroyed_card.ability.set == "Joker" then
					SMODS.scale_card(card, {
						ref_table = card.ability.extra,
						ref_value = "xmult",
						scalar_value = "xmult_mod",
						operation = function(ref_table, ref_value, initial, change)
							ref_table[ref_value] = initial
								+ (change * (tonumber(destroyed_card.ability.jest_held_for) or 0))
						end,
					})
				end
			end
			return nil, true
		end

		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult,
			}
		end
	end,
}

local ease_roundref = ease_round
function ease_round(mod)
	for i = 1, #G.jokers.cards do
		if G.jokers.cards[i].ability.jest_held_for ~= nil then
			G.jokers.cards[i].ability.jest_held_for = tostring(mod + tonumber(G.jokers.cards[i].ability.jest_held_for))
		else
			G.jokers.cards[i].ability.jest_held_for = tostring(mod)
		end
	end
	local ref = ease_roundref(mod)
	return ref
end
-- Unnecessary for Truhan, but needed for other effects
local card_set_ability_ref = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
	local ret = card_set_ability_ref(self, center, initial, delay_sprites)

	self.ability.jest_held_for = "0"

	return ret
end
return { name = { "Jokers" }, items = { truhan } }
