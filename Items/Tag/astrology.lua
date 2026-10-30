local astrology_tag = {
	object_type = "Tag",
	key = "astrology",
	pos = { x = 0, y = 4 },
	atlas = "tag_atlas",
	discovered = false,
	order = 99,
	min_ante = nil,
	attributes = { "planet", "retrigger" },

	loc_vars = function(self, info_queue) end,

	apply = function(self, tag, context)
		if context.type == "using_consumeable" and not context.aij_retriggered_consumable then
			local retriggered = false
			if context.consumeable.ability.set == "Planet" then
				local retrigger_count = pseudorandom("jest_astrology_tag", 2, 4)
				for i = 1, retrigger_count do
					if
						type(context.consumeable.can_use_consumeable) == "function"
						and context.consumeable:can_use_consumeable(true, true)
					then
						retriggered = true
						SMODS.calculate_context({
							using_consumeable = true,
							consumeable = context.consumeable,
							area = context.from_area,
							aij_retriggered_consumable = true,
						})
						G.E_MANAGER:add_event(Event({
							func = function()
								tag:juice_up()
								return true
							end,
						}))
						card_eval_status_text(
							context.consumeable,
							"extra",
							nil,
							nil,
							nil,
							{ message = localize("k_again_ex"), colour = G.C.FILTER }
						)
						context.consumeable:use_consumeable(context.area)
					else
						break
					end
				end

				local context_consumable = context.consumeable
				local context_area = context.area
			end
			tag:jest_apply("+", G.C.ATTENTION, function()
				return true
			end, function()
				return retriggered
			end)
			if retriggered then
				tag.triggered = true
				return true
			end
			return
		end
	end,

	in_pool = function(self, args)
		return false
	end,
}
return { name = "Tags", items = { astrology_tag } }
