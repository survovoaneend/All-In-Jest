local cut_here = {
	object_type = "Joker",
	order = 370,
	key = "cut_here",
	config = {},
	attributes = { "on_destroy", "generation", "joker", "rarity" },
	rarity = 2,
	pos = { x = 4, y = 14 },
	atlas = "joker_atlas",
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = true,

	loc_vars = function(self, info_queue, card) end,

	calculate = function(self, card, context)
		if context.joker_type_destroyed then
			local this_card = context.blueprint_card or card
			if context.card == this_card then
				G.E_MANAGER:add_event(Event({
					func = function()
						new_joker = SMODS.add_card({
							set = "Joker",
							area = G.jokers,
							rarity = 1,
							key_append = "cut_here",
						})
						new_joker:start_materialize()
						return true
					end,
				}))
				return nil, true
			end
		end
	end,
}

return { name = { "Jokers" }, items = { cut_here } }
