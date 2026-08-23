local saluto = {
	object_type = "Joker",
	order = 1077,
	key = "saluto",
	config = {},
	attributes = { "generation" },
	rarity = 4,
	pos = { x = 3, y = 14 },
	atlas = "legendary_atlas",
	cost = 20,
	unlocked = false,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = true,
	soul_pos = { x = 3, y = 15 },

	loc_vars = function(self, info_queue, card) end,

	calculate = function(self, card, context)
		if context.starting_shop then
			G.E_MANAGER:add_event(Event({
				trigger = "before",
				func = function()
					local prev = G.GAME.aij_rare_packs_rate
					G.GAME.aij_rare_packs_rate = 1
					local new_booster = SMODS.add_booster_to_shop(get_pack("saluto", "aij_rare").key)
                    new_booster.ability.couponed = true
                    new_booster:set_cost()
					G.GAME.aij_rare_packs_rate = prev
					card:juice_up()
					return true
				end,
			}))
			return nil, true
		end
	end,

	add_to_deck = function(self, card, from_debuff)
		if not from_debuff and G.STATE == G.STATES.SHOP then
			G.E_MANAGER:add_event(Event({
				trigger = "before",
				func = function()
					local prev = G.GAME.aij_rare_packs_rate
					G.GAME.aij_rare_packs_rate = 1
					local new_booster = SMODS.add_booster_to_shop(get_pack("saluto", "aij_rare").key)
                    new_booster.ability.couponed = true
                    new_booster:set_cost()
					card:juice_up()
					return true
				end,
			}))
			return nil, true
		end
	end,
}
return { name = { "Jokers" }, items = { saluto } }
