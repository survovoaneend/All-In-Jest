local auspicious_tag = {
	object_type = "Tag",
	key = "auspicious",

	pos = { x = 11, y = 1 },
	atlas = "tag_atlas",
	config = {
		aij = {
			upgrade = "aij_fortunate",
		},
	},
	attributes = { "generation", "tarot", "editions", "negative", "choice" },

	discovered = false,
	order = 32,
	min_ante = nil,

	loc_vars = function(self, info_queue, tag)
		return { vars = {} }
	end,

	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			tag:jest_apply("+", G.C.ATTENTION, function()
				G.E_MANAGER:add_event(Event({
					func = function()
						G.SETTINGS.paused = true
						G.FUNCS.overlay_menu({
							config = { no_esc = true },
							definition = SMODS.jest_no_back_card_collection_UIBox(G.P_CENTER_POOLS.Tarot, { 5, 6 }, {
								no_materialize = true,
								add_to_area = G.consumeables,
								add_to_area_args = { copies = 3 },
								modify_card = function(card, center)
									local edition = { negative = true }
									card:set_edition(edition, true, true)
								end,
								h_mod = 1.05,
							}),
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
				return true
			end, function()
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
}
return { name = "Tags", items = { auspicious_tag } }
