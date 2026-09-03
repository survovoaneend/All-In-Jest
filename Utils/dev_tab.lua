
-- Adds a tab to the mod config that lets you see incorrectly configured jokers
-- This tab is hidden unless you change the DEV_TAB_DEBUG variable in nevernamed.lua

All_in_Jest.extra_tabs = function()
	local text_scale = 0.6
	return {
		{
			label = "Dev",
			tab_definition_function = function()
				return {
					n = G.UIT.ROOT,
					config = { r = 0.1, minw = 4, align = "tm", padding = 0.2, colour = G.C.BLACK },
					nodes = {
						{
							n = G.UIT.R,
							config = {
								align = "cm",
								padding = 0.1,
								outline_colour = G.C.JOKER_GREY,
								r = 0.1,
								outline = 1,
							},
							nodes = {
								{
									n = G.UIT.R,
									config = { align = "tm", padding = 0 },
									nodes = {
										UIBox_button({
											button = "your_collection_jokers_dev_attributes",
											label = { "Jokers with no Attributes" },
											minw = 5,
											minh = 1.7,
											scale = 0.6,
											id = "your_collection_jokers_dev_attributes",
										}),
									},
								},
								{
									n = G.UIT.R,
									config = { align = "tm", padding = 0 },
									nodes = {
										UIBox_button({
											button = "your_collection_jokers_dev_legendaries",
											label = { "Legendaries not $20" },
											minw = 5,
											minh = 1.7,
											scale = 0.6,
											id = "your_collection_jokers_dev_legendaries",
										}),
									},
								},
							},
						},
					},
				}
			end,
		},
	}
end

G.FUNCS.your_collection_jokers_dev_legendaries = function(e)
	G.SETTINGS.paused = true
	local pool = {}
	for _, center in ipairs(G.P_CENTER_POOLS.Joker) do
		if center.mod and center.mod.id == "allinjest" then
			if center.rarity == 4 and center.cost ~= 20 then
				table.insert(pool, center)
			end
		end
	end
	G.FUNCS.overlay_menu({
		definition = create_UIBox_your_collection_jokers_dev(pool),
	})
end
G.FUNCS.your_collection_jokers_dev_attributes = function(e)
	G.SETTINGS.paused = true
	local pool = {}
	for _, center in ipairs(G.P_CENTER_POOLS.Joker) do
		if center.mod and center.mod.id == "allinjest" then
			if not center.attributes or #center.attributes == 0 then
				table.insert(pool, center)
			end
		end
	end
	G.FUNCS.overlay_menu({
		definition = create_UIBox_your_collection_jokers_dev(pool),
	})
end
create_UIBox_your_collection_jokers_dev = function(pool)
	return SMODS.card_collection_UIBox(pool, { 5, 5, 5 }, {
		no_materialize = true,
		modify_card = function(card, center)
			card.sticker = get_joker_win_sticker(center)
		end,
		h_mod = 0.95,
	})
end
