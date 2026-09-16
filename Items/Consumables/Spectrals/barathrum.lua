local barathrum = {
	object_type = "Consumable",
	key = "barathrum",
	set = "Spectral",
	atlas = "consumable_atlas",
	pos = { x = 9, y = 8 },
	cost = 4,
	unlocked = true,
	discovered = false,
	order = 13,
	config = { extra = { select = 2 } },
	attributes = { "tarot", "choice" },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.select,
			},
		}
	end,
	can_use = function(self, card)
		-- For Dark Magician compat
		for _, pool in pairs(G.P_CENTER_POOLS) do
			local available = 0
			for key, val in pairs(pool) do
				if not G.GAME.all_in_jest.banned_keys_barathrum[val.key] then
					available = available + 1
				end
			end
			if #pool > card.ability.extra.select and available < card.ability.extra.select then
				return false
			end
		end
		return true
	end,
	use = function(self, card)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.SETTINGS.paused = true
				G.GAME.aij_barathrum_choices_remaining = card.ability.extra.select
				G.FUNCS.overlay_menu({
					config = {},
					definition = SMODS.jest_no_back_card_collection_UIBox(G.P_CENTER_POOLS.Tarot, { 5, 6 }, {
						hide_single_page = true,
						collapse_single_page = true,
						add_to_area = true,
						add_to_area_args = {
							alt_text = localize("k_aij_remove"),
							alt_colour = HEX("dd463c"),
						},
						add_to_area_select_func = "jest_barathrum_remove",
						add_to_area_filter = function(card, center, i, j, pool, index)
							return not G.GAME.all_in_jest.banned_keys_barathrum[card.config.center.key]
						end,
						h_mod = 1.05,
					}),
				})
				return true
			end,
		}))
	end,
	in_pool = function(self, args)
		-- For Dark Magician compat
		for _, pool in pairs(G.P_CENTER_POOLS) do
			local available = 0
			for key, val in pairs(pool) do
				if not G.GAME.all_in_jest.banned_keys_barathrum[val.key] then
					available = available + 1
				end
			end
			if #pool > card.ability.extra.select and available < card.ability.extra.select then
				return false
			end
		end
		return true
	end,
}
G.FUNCS.jest_barathrum_remove = function(e)
	local card = e.config.ref_table
	local area = e.config.data[1]
	local data = e.config.data[2]
	G.GAME.all_in_jest.banned_keys_barathrum = G.GAME.all_in_jest.banned_keys_barathrum or {}
	G.GAME.all_in_jest.banned_keys_barathrum[card.config.center.key] = true
	card:start_dissolve({ G.C.RED }, nil, 0.5)
	G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 0.2,
		func = function()
			G.GAME.aij_barathrum_choices_remaining = G.GAME.aij_barathrum_choices_remaining - 1
			if G.GAME.aij_barathrum_choices_remaining > 0 then
				G.E_MANAGER:add_event(Event({
					func = function()
						G.SETTINGS.paused = true
						G.FUNCS.overlay_menu({
							config = { offset = { x = 0, y = 0 } },
							definition = SMODS.jest_no_back_card_collection_UIBox(G.P_CENTER_POOLS.Tarot, { 5, 6 }, {
								hide_single_page = true,
								collapse_single_page = true,
								offset = { x = 0, y = -G.ROOM.T.h / 2 },
								no_materialize = true,
								juice_card = { 0.2, 0.1 },
								add_to_area = true,
								add_to_area_args = {
									alt_text = localize("k_aij_remove"),
									alt_colour = HEX("dd463c"),
									bond = "Strong",
								},
								add_to_area_select_func = "jest_barathrum_remove",
								add_to_area_filter = function(card, center, i, j, pool, index)
									return not G.GAME.all_in_jest.banned_keys_barathrum[card.config.center.key]
								end,
								h_mod = 1.05,
							}),
						})
						return true
					end,
				}))
			else
				if G.OVERLAY_MENU ~= nil then
					G.OVERLAY_MENU:remove()
				end
				G.SETTINGS.paused = false
				G.OVERLAY_MENU = nil
			end
			return true
		end,
	}))
end

local smods_add_to_pool_ref = SMODS.add_to_pool
function SMODS.add_to_pool(prototype_obj, ...)
	if G.GAME.all_in_jest.banned_keys_barathrum[prototype_obj.key] then
		return false
	else
		return smods_add_to_pool_ref(prototype_obj, ...)
	end
end

return { name = { "Spectrals" }, items = { barathrum } }
