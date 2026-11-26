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
				G.E_MANAGER:add_event(Event({
					func = function()
						for _, r in ipairs({ "Common", "Uncommon" }) do
							SMODS.add_card({
								set = "Joker",
								area = G.jokers,
								rarity = r,
								edition = "e_negative",
								key_append = "jest_bierstiefel_tag",
							})
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
return { name = "Tags", items = { bierstiefel_tag } }
