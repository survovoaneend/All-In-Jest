local function contains_number(table, exclusions)
	table = recursive_table_cull(table)
	for k, v in pairs(table) do
		if exclusions and exclusions[k] ~= nil and (exclusions[k] == true or exclusions[k] == v) then
		else
			if type(v) == "number" and v ~= 0 then
				return true
			elseif type(v) == "table" and contains_number(v, exclusions) then
				return true
			end
		end
	end
	return false
end

local silver = {
	object_type = "Tag",
	key = "silver",
	pos = { x = 1, y = 1 },
	atlas = "tag_atlas",
	order = 3, -- Works because of alphabetical sorting of those with same order
	min_ante = 2,
	config = { type = "store_joker_create", edition = "aij_silver" },
	attributes = { "joker", "editions" },
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_aij_silver
		return {}
	end,

	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local dongtong_compat_pool = SMODS.create_poll_pool({ "Joker" }, {
				type = "Joker",
				types = { "Joker" },
				guarenteed = true,
				append = "silverta",
			})
			for i, center in ipairs(dongtong_compat_pool) do
				if G.P_CENTERS[center.key].dongtong_compat == false then
					dongtong_compat_pool[i].key = "UNAVAILABLE"
				elseif
					not contains_number(
						G.P_CENTERS[center.key].config,
						{ x_chips = 1, x_mult = 1, extra_value = true, rarity = true }
					)
				then
					dongtong_compat_pool[i].key = "UNAVAILABLE"
				end
			end

			local forced_key = SMODS.poll_object({
				type = "Joker",
				guaranteed = true,
				pool = dongtong_compat_pool,
				append = "silverta",
			})
			local card = SMODS.create_card({
				set = "Joker",
				key = forced_key,
				area = context.area,
				key_append = "silverta",
				no_edition = true,
			})

			create_shop_card_ui(card, "Joker", context.area)
			card.states.visible = false
			tag:yep("+", G.C.GREEN, function()
				card:set_edition({ aij_silver = true })
				card:start_materialize()
				card.ability.couponed = true
				card:set_cost()
				return true
			end)
			tag.triggered = true
			return card
		end
	end,
}
return { name = "Tags", items = { silver } }
