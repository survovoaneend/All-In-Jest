local bierstiefel_tag = {
	object_type = "Tag",
	key = "bierstiefel",

	pos = { x = 8, y = 2 },
	atlas = "tag_atlas",
	config = {
		aij = {
			upgrade = "top_up",
		},
	},
	attributes = { "generation", "joker", "rarity" },

	discovered = false,
	order = 21,
	min_ante = 2,

	loc_vars = function(self, info_queue, tag) end,

	apply = function(self, tag, context)
		if context.type == "immediate" then
			tag:jest_apply("+", G.C.ATTENTION, function()
				if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
					local jokers_to_create = G.jokers.config.card_limit - #G.jokers.cards
					G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
					G.E_MANAGER:add_event(Event({
						func = function()
							for i = 1, jokers_to_create do
								local new_joker = SMODS.add_card({
									set = "Joker",
									area = G.jokers,
									rarity = pseudorandom("jest_bierstiefel_tag") * 0.95,
									key_append = "jest_bierstiefel_tag",
								})
								new_joker:start_materialize()
								G.GAME.joker_buffer = 0
							end
							return true
						end,
					}))
				end
				return true
			end, function()
				return #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
			end)
			if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
				tag.triggered = true
				return true
			end
			return
		end
	end,
}
return { name = "Tags", items = { bierstiefel_tag } }
