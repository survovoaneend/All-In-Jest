-- SMODS definition

G.Astral = {} -- stores Astral pins
All_in_Jest.Astral = SMODS.Tag:extend({
	set = "aij_astral",
	is_pin = true,
	atlas = "consumable_atlas",
	class_prefix = "c",
	in_pool = function()
		return false
	end,
	inject = function(self)
		G.Astral[self.pin] = self
	end,
	generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
		if not card then
			card = self:create_fake_card()
		end
		local set_check = self.alt_set or self.set
		local target = {
			type = "descriptions",
			key = self.key,
			set = set_check,
			nodes = desc_nodes,
			AUT = full_UI_table,
			vars = specific_vars or {},
		}
		local res = {}
		if self.loc_vars and type(self.loc_vars) == "function" then
			res = self:loc_vars(info_queue, card) or {}
			target.vars = res.vars or target.vars
			target.key = res.key or target.key
			target.set = res.set or target.set
			target.scale = res.scale
			target.text_colour = res.text_colour
		end

		if desc_nodes == full_UI_table.main and not full_UI_table.name then
			full_UI_table.name = set_check == "Enhanced" and "temp_value"
				or localize({
					type = "name",
					set = target.set,
					key = res.name_key or target.key,
					nodes = full_UI_table.name,
					vars = res.name_vars or target.vars or {},
				})
		elseif desc_nodes ~= full_UI_table.main and not desc_nodes.name and set_check ~= "Enhanced" then
			desc_nodes.name = localize({ type = "name_text", key = res.name_key or target.key, set = target.set })
		end
		if specific_vars and specific_vars.debuffed and not res.replace_debuff then
			target = {
				type = "other",
				key = "debuffed_" .. (specific_vars.playing_card and "playing_card" or "default"),
				nodes = desc_nodes,
				AUT = full_UI_table,
			}
		end
		if res.main_start then
			desc_nodes[#desc_nodes + 1] = res.main_start
		end

		localize(target)

		if res.main_end then
			desc_nodes[#desc_nodes + 1] = res.main_end
		end
		desc_nodes.background_colour = res.background_colour
	end,
})

All_in_Jest.Astral_Grades = {}
All_in_Jest.Astral_Grade = SMODS.Sticker:extend({
	obj_table = All_in_Jest.Astral_Grades,
	atlas = "stickers_atlas",
	class_prefix = "astral_grade",
	atlas = "stickers_atlas",
	pos = { x = 0, y = 3 },
	no_collection = true,
	sets = { aij_astral = true },
	rate = 0,
	all_in_jest = { rarity = 0 },
	apply = function(self, card, val)
		card.ability.astral_grade = self.key
		card.ability.astral_hand = self:choose_hand()
		if self.config and next(self.config) then
			card.ability[self.key] = {}
			for k, v in pairs(self.config) do
				if type(v) == "table" then
					card.ability[self.key][k] = copy_table(v)
				else
					card.ability[self.key][k] = v
					if k == "card_limit" or k == "extra_slots_used" then
						card.ability[k] = (card.ability[k] or 0) + v
					end
				end
			end
		end
	end,
})

SMODS.ConsumableType({
	key = "aij_astral",
	primary_colour = HEX("d1e2f6"),
	secondary_colour = HEX("87a5c9"),
	collection_rows = { 5, 4 },
	shop_rate = 0,
	default = "c_aij_algol",
	no_buy_and_use = false,
	no_collection = not All_in_Jest.config.astrals_enabled,
	inject_card = function(self, center)
		local set_ability_ref = center.set_ability
		center.set_ability = function(self, card, initial, delay_sprites)
			card.ability = copy_table(card.ability)
			local center_cfg = card.config.center
			local grade = All_in_Jest.astral_set_grade(center_cfg.all_in_jest and center_cfg.all_in_jest.grades)
			grade:apply(card)

			if set_ability_ref then
				return set_ability_ref(self, card, initial, delay_sprites)
			end
		end

		if not center.loc_vars_astral_applied then
			center.loc_vars_astral_applied = true
			local loc_vars_ref = center.loc_vars
			center.loc_vars = function(self, info_queue, card)
				local pin_count = 0
				if
					G.GAME.Astral_pins
					and #G.GAME.Astral_pins
					and card.ability.consumeable
					and card.ability.astral_hand
					and G.GAME.Astral_pins[card.ability.astral_hand]
				then
					pin_count = #G.GAME.Astral_pins[card.ability.astral_hand]
				end
				local pins_left = math.max((G.GAME.all_in_jest.astral_pin_per_hand or 3) - pin_count, 0)

				local ret = {}
				if loc_vars_ref then
					ret = loc_vars_ref(self, info_queue, card)
				end

				if
					not (card.area and card.area.config.collection and not card.area.config.aij_card_select_collection)
				then
					info_queue[#info_queue + 1] = { key = card.ability.astral_grade, set = "Other" }
					ret.main_end = ret.main_end or {}
					if card.ability.astral_hand ~= "All Hands" then
						ret.main_end[#ret.main_end + 1] = {
							n = G.UIT.R,
							config = { align = "cm" },
							nodes = {
								{
									n = G.UIT.R,
									config = { align = "cm", padding = 0.02 },
									nodes = {
										{
											n = G.UIT.T,
											config = {
												text = localize({
													type = "variable",
													key = "a_aij_slots_left",
													vars = { pins_left },
												}),
												colour = G.C.UI.TEXT_INACTIVE,
												scale = 0.32,
											},
										},
									},
								},
							},
						}
					end
				end

				return ret
			end
		end

		if not center.can_use then
			center.can_use = function(self, card)
				return true
			end
		end
		if not center.use then
			center.use = function(self, card, area, copier)
				All_in_Jest.use_astral_card(card)
				if
					G.aij_cur_astral_hand
					and (G.aij_cur_astral_hand == card.ability.astral_hand or G.aij_cur_astral_hand == "Omnigrade")
					and G.GAME.Astral_pins
				then
					if G.aij_astral_pin_area and #G.aij_astral_pin_area.cards > 0 then
						All_in_Jest.astral_visuals(
							G.aij_cur_astral_hand,
							"only_remove",
							All_in_Jest.old_colours or nil,
							true
						)
						for _, v in pairs(G.aij_astral_pin_area.cards) do
							v:remove()
						end
					end
					All_in_Jest.astral_visuals(G.aij_cur_astral_hand, "no_remove")
				end
			end
		end
		SMODS.ObjectType.inject_card(self, center)
	end,
})

SMODS.UndiscoveredSprite({
	key = "aij_astral",
	atlas = "consumable_atlas",
	pos = { x = 15, y = 4 },
	overlay_pos = { x = 16, y = 4 },
})

--Sets an Astral cards grade
function All_in_Jest.astral_set_grade(rarity)
	local polled_value = pseudorandom("aij_astral_grade")

	local rarity_sum = 0
	for _, v in pairs(All_in_Jest.Astral_Grades) do
		if rarity and rarity[v.key] then
			rarity_sum = rarity_sum + rarity[v.key]
		else
			rarity_sum = rarity_sum + v.all_in_jest.rarity
		end
	end
	polled_value = polled_value * rarity_sum

	local ongoing_sum = 0
	for _, v in pairs(All_in_Jest.Astral_Grades) do
		if rarity and rarity[v.key] then
			ongoing_sum = ongoing_sum + rarity[v.key]
		else
			ongoing_sum = ongoing_sum + v.all_in_jest.rarity
		end
		if polled_value <= ongoing_sum then
			return v
		end
	end
end

function All_in_Jest.create_astral_pin(card, index)
	if card.ability.astral_hand == "All Hands" then
		for k, _ in pairs(G.GAME.Astral_pins) do
			if index or #G.GAME.Astral_pins[k] < G.GAME.all_in_jest.astral_pin_per_hand then
				if not index then
					index = #G.GAME.Astral_pins[k] + 1
				end
				G.GAME.Astral_pins[k][index] = {}
				G.GAME.Astral_pins[k][index]["pin"] = card.ability.consumeable.pin
				G.GAME.Astral_pins[k][index].ability = {}
				G.GAME.Astral_pins[k][index].ability.extra = card.ability.extra
			end
		end
	else
		if not index then
			index = #G.GAME.Astral_pins[card.ability.astral_hand] + 1
		end
		G.GAME.Astral_pins[card.ability.astral_hand][index] = {}
		G.GAME.Astral_pins[card.ability.astral_hand][index]["pin"] = card.ability.consumeable.pin
		G.GAME.Astral_pins[card.ability.astral_hand][index].ability = {}
		G.GAME.Astral_pins[card.ability.astral_hand][index].ability.extra = card.ability.extra
	end
end

function All_in_Jest.use_astral_card(card)
	if
		card.ability.astral_hand ~= "All Hands"
		and G.GAME.Astral_pins[card.ability.astral_hand]
		and #G.GAME.Astral_pins[card.ability.astral_hand] >= G.GAME.all_in_jest.astral_pin_per_hand
	then
		if G.GAME.Astral_pins and G.aij_astral_pin_area and #G.aij_astral_pin_area.cards > 0 then
			All_in_Jest.astral_visuals(card.ability.astral_hand, "only_remove", All_in_Jest.old_colours or nil, true)
			for _, v in pairs(G.aij_astral_pin_area.cards) do
				v:remove()
			end
		end
		if G.GAME.Astral_pins then
			All_in_Jest.astral_visuals(card.ability.astral_hand, "no_remove")
		end
		G.E_MANAGER:add_event(Event({
			func = function()
				G.SETTINGS.paused = true
				G.FUNCS.overlay_menu({
					config = {},
					definition = SMODS.jest_no_back_card_collection_UIBox(G.aij_astral_pin_area.cards, { 6, 6 }, {
						from_area = true,
						card_scale = 1,
						hide_single_page = true,
						collapse_single_page = true,
						modify_card = function(cardd, center)
							if cardd and cardd.config.center then
								cardd.bypass_discovery_center = true
								cardd.bypass_discovery_ui = true
								cardd:set_ability(cardd.config.center)
								for k, v in pairs(center.ability) do
									if type(v) == "table" then
										cardd.ability[k] = copy_table(v)
									else
										cardd.ability[k] = v
									end
								end
								local index = nil
								for k, v in pairs(G.aij_astral_pin_area.cards) do
									if v == center then
										index = k
									end
								end
								jest_create_select_card_ui(cardd, G.aij_astral_pin_area, {
									alt_text = localize("k_aij_replace"),
									alt_colour = HEX("87a5c9"),
									consumable_card = card,
									astral_index = index,
								}, "jest_astral_replace")
							end
						end,
						h_mod = 1.05,
					}),
				})
				if G.GAME.Astral_pins then
					All_in_Jest.astral_visuals(
						card.ability.astral_hand,
						"only_remove",
						All_in_Jest.old_colours or nil,
						true
					)
					if G.aij_astral_pin_area then
						for _, v in pairs(G.aij_astral_pin_area.cards) do
							v:remove()
						end
					end
				end
				return true
			end,
		}))
	else
		All_in_Jest.create_astral_pin(card)
	end
end

function All_in_Jest.astral_background(_type, colours)
	if _type then
		ease_background_colour({
			special_colour = darken(colours.background[1], 0.5),
			new_colour = colours.background[2],
			tertiary_colour = colours.background[3],
			contrast = 1,
		})
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.26,
			blocking = false,
			blockable = false,
			func = function()
				G.aij_astral_stars = G.aij_astral_stars
					or Particles(1, 1, 0, 0, {
						timer = 0.07,
						scale = 0.1,
						initialize = true,
						lifespan = 15,
						speed = 0.1,
						padding = -4,
						attach = G.ROOM_ATTACH,
						colours = colours.stars,
						fill = true,
					})
				G.aij_astral_meteors = G.aij_astral_meteors
					or Particles(1, 1, 0, 0, {
						timer = 2,
						scale = 0.05,
						lifespan = 1.5,
						speed = 4,
						attach = G.ROOM_ATTACH,
						colours = { colours.stars[1] },
						fill = true,
					})
				return true
			end,
		}))
	else
		ease_background_colour({
			special_colour = colours.background[1],
			tertiary_colour = colours.background[2],
			new_colour = colours.background[3],
			contrast = colours.background[4],
		})
		if G.aij_astral_stars then
			G.aij_astral_stars:fade(0.25)
		end
		if G.aij_astral_meteors then
			G.aij_astral_meteors:fade(0.25)
		end

		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.25,
			blocking = false,
			blockable = false,
			func = function()
				if G.aij_astral_stars then
					G.aij_astral_stars:remove()
					G.aij_astral_stars = nil
				end
				if G.aij_astral_meteors then
					G.aij_astral_meteors:remove()
					G.aij_astral_meteors = nil
				end
				return true
			end,
		}))
	end
end

function All_in_Jest.astral_visuals(hand, extra, old_colours, immediate, colours)
	local old_colours = old_colours
		or {
			special_colour = copy_table(G.C.BACKGROUND.C),
			tertiary_colour = copy_table(G.C.BACKGROUND.D),
			new_colour = copy_table(G.C.BACKGROUND.L),
			contrast = 1,
		}
	colours = colours or {}
	if extra == "only_color" then
		if not immediate then
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 1,
				func = function()
					All_in_Jest.astral_background(nil, {
						background = {
							old_colours.special_colour,
							old_colours.tertiary_colour,
							old_colours.new_colour,
							old_colours.contrast,
						},
					})
					return true
				end,
			}))
		else
			All_in_Jest.astral_background(nil, {
				background = {
					old_colours.special_colour,
					old_colours.tertiary_colour,
					old_colours.new_colour,
					old_colours.contrast,
				},
			})
		end
		return
	end
	if extra ~= "only_remove" then
		-- Add astral pins
		local astrals = 0
		if G.GAME.Astral_pins[hand] then
			for _, _ in pairs(G.GAME.Astral_pins[hand]) do
				astrals = astrals + 1
			end
		end
		if astrals == 0 then
			All_in_Jest.astral_visuals(hand, "only_remove", All_in_Jest.old_colours or old_colours, true)
			return
		end
		if G.GAME.Astral_pins[hand] then
			local k = hand
			local v = G.GAME.Astral_pins[hand]
			for _, i in pairs(v) do
				local center = G.Astral[i.pin]
				local card = Card(
					G.aij_astral_pin_area.T.x + G.aij_astral_pin_area.T.w / 2,
					G.aij_astral_pin_area.T.y,
					G.CARD_W,
					G.CARD_H,
					G.P_CARDS.empty,
					center,
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.config.center_key = i.pin
				for k_, vi in pairs(card.config.center.config) do
					card.ability[k_] = vi
				end
				for k_, vi in pairs(G.GAME.Astral_pins[k][_].ability) do
					card.ability[k_] = vi
				end
				card.ability.extra.hand = k
				card.config.center.set_card_type_badge = function(self, card, badges)
					badges = {}
				end
				G.aij_astral_pin_area:emplace(card)
				card:start_materialize()
				-- We shouldn't need to do this but we have to anyway
				-- This is to make a couple pins juice when active
				local obj = card.config.center
				if obj and obj.add_to_deck and type(obj.add_to_deck) == "function" then
					obj:add_to_deck(card, from_debuff)
				end
			end
		end
		-- Change background colour
		All_in_Jest.astral_background(true, {
			background = colours.background or { HEX("d1e2f6"), HEX("87a5c9"), HEX("d1e2f6") },
			stars = colours.stars or { G.C.WHITE, HEX("d1e2f6"), HEX("9ec5d7") },
		})
		delay(0.4)
	end
	if extra ~= "no_remove" then
		if not immediate then
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 1,
				func = function()
					All_in_Jest.astral_background(nil, {
						background = {
							old_colours.special_colour,
							old_colours.tertiary_colour,
							old_colours.new_colour,
							old_colours.contrast,
						},
					})
					if G.aij_astral_pin_area then
						for _, v in pairs(G.aij_astral_pin_area.cards) do
							v:remove()
						end
					end
					return true
				end,
			}))
		else
			All_in_Jest.astral_background(nil, {
				background = {
					old_colours.special_colour,
					old_colours.tertiary_colour,
					old_colours.new_colour,
					old_colours.contrast,
				},
			})
			if G.aij_astral_pin_area then
				for _, v in pairs(G.aij_astral_pin_area.cards) do
					v:remove()
				end
			end
		end
	end
end

----- Hooks -----

local aij_ease_bg_blind_ref = ease_background_colour_blind
function ease_background_colour_blind(state, blind_override)
	All_in_Jest.old_colours = nil
	aij_ease_bg_blind_ref(state, blind_override)
end

local aij_ease_bg_ref = ease_background_colour
function ease_background_colour(args)
	if All_in_Jest.old_colours == nil then
		All_in_Jest.old_colours = {
			special_colour = copy_table(args["special_colour"]),
			tertiary_colour = copy_table(args["tertiary_colour"]),
			new_colour = copy_table(args["new_colour"]),
			contrast = args.contrast or 1,
		}
	end
	aij_ease_bg_ref(args)
end

local aij_game_update_astral_ref = Game.update
function Game:update(dt)
	local ref = aij_game_update_astral_ref(self, dt)
	if
		G.GAME.Astral_pins
		and G.hand
		and #G.hand.highlighted <= 0
		and G.aij_cur_astral_hand ~= nil
		and G.play
		and #G.play.cards <= 0
		and G.STATE ~= G.STATES.HAND_PLAYED
		and G.STATE ~= G.STATES.DRAW_TO_HAND
	then
		All_in_Jest.astral_visuals(text, "only_remove", All_in_Jest.old_colours or nil, true)
		G.aij_cur_astral_hand = nil
		if G.aij_astral_pin_area then
			for _, v in pairs(G.aij_astral_pin_area.cards) do
				v:remove()
			end
		end
	end
	return ref
end

-- Hook to make astral pins move out of the way outside of a round
local aij_cardarea_move_ref = CardArea.move
function CardArea:move(dt)
	local ret = aij_cardarea_move_ref(self, dt)

	if self == G.aij_astral_pin_area then
		local desired_y = G.ROOM.T.h / 4
		if
			not (
				G.STATE == G.STATES.SELECTING_HAND
				or G.STATE == G.STATES.HAND_PLAYED
				or G.STATE == G.STATES.DRAW_TO_HAND
			)
		then
			desired_y = desired_y * -1
		end
		G.aij_astral_pin_area.T.y = desired_y
	end

	return ret
end

local aij_create_UIBox_hand_tip_ref = create_UIBox_hand_tip
function create_UIBox_hand_tip(handname)
	ret = aij_create_UIBox_hand_tip_ref(handname)

	-- Show applied astral pins
	local astrals = 0
	if G.GAME and G.GAME.Astral_pins and G.GAME.Astral_pins[handname] then
		for _, _ in pairs(G.GAME.Astral_pins[handname]) do
			astrals = astrals + 1
		end
	end
	if astrals > 0 then
		local astral_pins_cardarea =
			CardArea(2, 2, 3.5 * G.CARD_W, 0.5 * G.CARD_H, { card_limit = 3, type = "title", highlight_limit = 0 })

		if G.GAME.Astral_pins[handname] then
			local v = G.GAME.Astral_pins[handname]
			for _, i in pairs(v) do
				local center = G.Astral[i.pin]
				local card = Card(
					astral_pins_cardarea.T.x + astral_pins_cardarea.T.w / 2,
					astral_pins_cardarea.T.y,
					G.CARD_W,
					G.CARD_H,
					G.P_CARDS.empty,
					center,
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.config.center_key = i.pin
				for k_, vi in pairs(card.config.center.config) do
					card.ability[k_] = vi
				end
				for k_, vi in pairs(G.GAME.Astral_pins[handname][_].ability) do
					card.ability[k_] = vi
				end
				card.ability.extra.hand = handname
				card.config.center.set_card_type_badge = function(self, card, badges)
					badges = {}
				end
				astral_pins_cardarea:emplace(card)
				card:start_materialize()
			end
		end

		ret = {
			n = G.UIT.R,
			config = { align = "cm", r = 0.1 },
			nodes = {
				{
					n = G.UIT.R,
					config = { align = "cm", colour = G.C.WHITE, r = 0.1 },
					nodes = {
						{
							n = G.UIT.C,
							config = { align = "cm" },
							nodes = {
								{ n = G.UIT.O, config = { object = astral_pins_cardarea } },
							},
						},
					},
				},
				ret,
			},
		}
	end

	return ret
end
