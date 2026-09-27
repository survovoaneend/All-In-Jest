SMODS.DynaTextEffect({
	key = "misprinted_red",
	draw_override = function(dynatext)
		local colour = G.C.RED
		local table_val = type(dynatext.config.string) == "string"
				and { string = dynatext.config.string, colour = colour }
			or dynatext.config.string
		dynatext.config.strings = dynatext.config.strings or { dynatext.config.string }
		local loc_mult = dynatext.config.strings[1][1]
		local strings = {
			{ string = "_rand()_", colour = G.C.JOKER_GREY },
			{
				string = "*$#@"
					.. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11)
					.. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.suit:sub(1, 1) or "D"),
				colour = colour,
			},
			loc_mult,
			loc_mult,
			loc_mult,
			loc_mult,
			loc_mult,
			loc_mult,
			loc_mult,
			loc_mult,
			loc_mult,
			loc_mult,
			loc_mult,
			loc_mult,
			loc_mult,
		}
		dynatext.config.pop_in_rate = 9999999
		dynatext.config.silent = true
		dynatext.config.random_element = true
		dynatext.config.scale = 0.32
		dynatext.config.min_cycle_time = 0
		G.aij_mis_wait_till = G.aij_mis_wait_till or G.TIMERS.REAL

		dynatext.start_pop_in = dynatext.config.pop_in
		local new = pseudorandom_element(strings, pseudoseed("misprinted"))
		local table = new
		if type(new) == "string" then
			table = { string = new, colour = colour }
		end
		dynatext.config.string = { [1] = G.cur_ran_mis_text } or { [1] = table }
		if G.TIMERS.REAL >= G.aij_mis_wait_till then
			G.cur_ran_mis_text = table
			G.aij_mis_wait_till = G.TIMERS.REAL + 0.2011
		end
		dynatext:update_text(true)
		if dynatext.config.maxw and dynatext.config.W > dynatext.config.maxw and not dynatext.config.marquee then
			dynatext.start_pop_in = dynatext.config.pop_in
			dynatext.scale = dynatext.scale * (dynatext.config.maxw / dynatext.config.W)
			dynatext:update_text(true)
		end
		dynatext.pop_delay = dynatext.config.pop_delay or 1.5
		dynatext:pop_out(4)
		dynatext_aij_draw(dynatext)
	end,
})
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
local misprinted = {
	object_type = "Tag",
	key = "misprinted",
	pos = { x = 3, y = 1 },
	atlas = "tag_atlas",
	order = 7,
	min_ante = 2,
	config = { type = "store_joker_create", edition = "aij_misprint" },
	attributes = { "joker", "editions" },
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_aij_misprint
		return {}
	end,

	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local dongtong_compat_pool = SMODS.create_poll_pool({ "Joker" }, {
				type = "Joker",
				types = { "Joker" },
				guarenteed = true,
				append = "misprintta",
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
				append = "misprintta",
			})
			local card = SMODS.create_card({
				set = "Joker",
				key = forced_key,
				area = context.area,
				key_append = "misprintta",
				no_edition = true,
			})

			create_shop_card_ui(card, "Joker", context.area)
			card.states.visible = false
			tag:yep("+", G.C.GREEN, function()
				card:set_edition({ aij_misprint = true })
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
return { name = "Tags", items = { misprinted } }
