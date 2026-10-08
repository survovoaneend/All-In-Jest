local soulbound_tag = {
	object_type = "Tag",
	key = "soulbound",

	pos = { x = 0, y = 0 },
	atlas = "tag_atlas",

	discovered = false,
	order = 0,
	min_ante = 4,
	attributes = { "generation", "joker", "rarity", "legendary", "stickers" },

	loc_vars = function(self, info_queue) end,

	-- Function defining the tag's effect
	apply = function(self, tag, context)
		if context.type == "immediate" then
			tag:jest_apply("+", G.C.RARITY[4], function()
				if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
					local perishable_compat_legendary_pool = SMODS.create_poll_pool({ "Joker" }, {
						type = "Joker",
						types = { "Joker" },
						guarenteed = true,
						rarity = 4,
						rarities = { "Legendary" },
						allow_legendaries = true,
						append = "perishable_legendary_tag",
					})
					for i, center in ipairs(perishable_compat_legendary_pool) do
						if not G.P_CENTERS[center.key].perishable_compat then
							perishable_compat_legendary_pool[i].key = "UNAVAILABLE"
						end
					end

					local forced_key = SMODS.poll_object({
						type = "Joker",
						guaranteed = true,
						pool = perishable_compat_legendary_pool,
						append = "perishable_legendary_tag",
					})
					local joker_card = SMODS.add_card({
						set = "Joker",
						key = forced_key,
						area = G.jokers,
						no_edition = true,
						rarity = 0,
						key_append = "perishable_legendary_tag",
						force_stickers = { "perishable" },
					})
					joker_card:start_materialize()
				end
				return true
			end, function()
				return #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
			end)
			if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
				tag.triggered = true
				return true
			end
			return
		end
	end,
}
return { name = "Tags", items = { soulbound_tag } }
