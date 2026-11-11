local star_magi_tarot = {
	object_type = "Consumable",
	key = "star_magi",
	set = "Tarot",
	pos = { x = 12, y = 8 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 16,
	config = {},
	attributes = { "generation", "astral" },
	atlas = "consumable_atlas",
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "astral_grade_aij_passigrade", set = "Other" }
		return {
			vars = {},
		}
	end,
	can_use = function(self, card, area, copier)
		if #G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables then
			return true
		end
	end,
	use = function(self, used_tarot)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("timpani")
				new_card = SMODS.add_card({
					set = "aij_astral",
					area = G.consumeables,
					key_append = "jest_star_magi",
				})
				All_in_Jest.Astral_Grades["astral_grade_aij_passigrade"]:apply(new_card)
				used_tarot:juice_up(0.3, 0.5)
				return true
			end,
		}))
	end,
}
return { name = { "Tarots" }, items = { star_magi_tarot } }
