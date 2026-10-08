local unusual_tag = {
	object_type = "Tag",
	key = "unusual",

	pos = { x = 9, y = 1 },
	atlas = "tag_atlas",
	config = {
		aij = {
			upgrade = "uncommon",
		},
		extra = {
			rarity = "Uncommon",
			sticker = "aij_unusual_doubled",
		},
	},
	attributes = { "generation", "joker", "rarity", "multiplier" },

	discovered = false,
	order = 1,
	min_ante = nil,

	loc_vars = function(self, info_queue) end,

	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local dongtong_compat_pool = SMODS.create_poll_pool({ "Joker" }, {
				type = "Joker",
				types = { "Joker" },
				guarenteed = true,
				rarity = 2,
				rarities = { "Uncommon" },
				append = "aij_unusual_tag",
			})
			for i, center in ipairs(dongtong_compat_pool) do
				if
					not SMODS.Stickers[tag.config.extra.sticker]:should_apply(
						nil,
						G.P_CENTERS[center],
						context.area,
						true
					)
				then
					dongtong_compat_pool[i].key = "UNAVAILABLE"
				end
			end

			local forced_key = SMODS.poll_object({
				type = "Joker",
				guaranteed = true,
				pool = dongtong_compat_pool,
				append = "aij_unusual_tag",
			})
			local card = SMODS.create_card({
				set = "Joker",
				key = forced_key,
				area = context.area,
				key_append = "aij_unusual_tag",
				no_edition = true,
				force_stickers = { tag.config.extra.sticker },
			})

			create_shop_card_ui(card, "Joker", context.area)
			card.states.visible = false
			tag:yep("+", G.C.GREEN, function()
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
return { name = "Tags", items = { unusual_tag } }
