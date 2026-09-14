local stereoscopic_tag = {
	object_type = "Tag",
	key = "stereoscopic",

	pos = { x = 9, y = 0 },
	atlas = "tag_atlas",
	config = {
		aij = {
			upgrade = "double",
		},
	},
	attributes = { "generation", "tag", "gold_tag" },

	discovered = false,
	order = 18,
	min_ante = nil,

	loc_vars = function(self, info_queue, tag)
		return { vars = {} }
	end,

	apply = function(self, tag, context)
		if context.type == "tag_add" then
			if context.tag.key ~= "tag_double" and context.tag.key ~= "tag_aij_stereoscopic" then

				local upgraded_tag_key = nil
				for k, v in pairs(G.P_TAGS) do
					if v.config.aij and v.config.aij.upgrade then
						if v.config.aij.upgrade == "tag_" .. v.config.aij.upgrade then
							upgraded_tag_key = v.key
							break
						end
					end
				end

				if context.tag.config.aij and context.tag.config.aij.upgrade then
				else
					if upgraded_tag_key == nil then
						return
					end
				end
				local lock = tag.ID
				G.CONTROLLER.locks[lock] = true
				tag:yep("+", G.C.BLUE, function()
					if context.tag.ability and context.tag.ability.orbital_hand then
						G.orbital_hand = context.tag.ability.orbital_hand
					end
					if context.tag.config.aij and context.tag.config.aij.upgrade then
						add_tag(Tag(context.tag.key))
					else
						add_tag(Tag(upgraded_tag_key))
					end
					G.orbital_hand = nil
					G.CONTROLLER.locks[lock] = nil
					return true
				end)
				tag.triggered = true
			end
		end
	end,
}
return { name = "Tags", items = { stereoscopic_tag } }
