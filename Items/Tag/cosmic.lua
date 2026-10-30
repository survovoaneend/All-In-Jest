local cosmic = {
	object_type = "Tag",
	key = "cosmic",
	pos = { x = 4, y = 1 },
	atlas = "tag_atlas",
	order = 8, -- Works because of alphabetical sorting of those with same order
	min_ante = 2,
	config = { type = "new_blind_choice", booster = "p_sidereal_jumbo" },
	attributes = { "booster", "astral" },
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.p_aij_sidereal_jumbo_1
		return {}
	end,

	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			local lock = tag.ID
			tag:yep("+", G.C.PURPLE, function()
				local key = "p_aij_sidereal_jumbo_" .. (math.random(1, 2))
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				card:start_materialize()
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
}
return { name = "Tags", items = { cosmic } }
