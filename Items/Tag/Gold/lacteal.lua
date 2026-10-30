local lacteal_tag = {
	object_type = "Tag",
	key = "lacteal",
	pos = { x = 12, y = 0 },
	atlas = "tag_atlas",
	discovered = false,
	order = 34,
	min_ante = 2,
	config = {
		aij = {
			upgrade = "aij_cosmic",
		},
	},
	attributes = { "generation", "astral", "choice" },

	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { key = "astral_grade_aij_omnigrade", set = "Other" }
	end,

	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			tag:jest_apply("+", G.C.ATTENTION, function()
				if (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
					G.E_MANAGER:add_event(Event({
						func = function()
							G.SETTINGS.paused = true
							G.FUNCS.overlay_menu({
								config = { no_esc = true },
								definition = SMODS.jest_no_back_card_collection_UIBox(
									G.P_CENTER_POOLS.aij_astral,
									{ 5, 4 },
									{
										no_materialize = true,
										add_to_area = G.consumeables,
										h_mod = 1.05,
										modify_card = function(card, center)
											All_in_Jest.Astral_Grades["astral_grade_aij_omnigrade"]:apply(card)
										end,
									}
								),
							})
							return true
						end,
					}))
					G.E_MANAGER:add_event(Event({
						func = function()
							for i = 1, #G.GAME.tags do
								if G.GAME.tags[i]:apply_to_run({ type = "new_blind_choice" }) then
									break
								end
							end
							return true
						end,
					}))
				end
				return true
			end, function()
				return (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit
			end)
			if (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
				tag.triggered = true
				return true
			end
			return
		end
	end,
}
return { name = "Tags", items = { lacteal_tag } }
