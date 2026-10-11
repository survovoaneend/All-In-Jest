local providence = {
	object_type = "Consumable",
	key = "providence",
	set = "Spectral",
	atlas = "consumable_atlas",
	pos = { x = 17, y = 8 },
	cost = 4,
	unlocked = true,
	discovered = false,
	order = 14,
	config = { extra = {} },
	attributes = { "generation", "tag" },
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_aij_astrology" }
		return {}
	end,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card)
		local tag_name = localize({ type = "name_text", set = "Tag", key = "tag_aij_astrology" })
		G.E_MANAGER:add_event(Event({
			func = function()
				add_tag(Tag("tag_aij_astrology"))
				play_sound("tarot1")
				return true
			end,
		}))
		return {
			message = "+" .. tag_name,
		}
	end,
}
return { name = { "Spectrals" }, items = { providence } }
