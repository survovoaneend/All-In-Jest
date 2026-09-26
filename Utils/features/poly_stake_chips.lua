-- SMODS definition

All_in_Jest.PolyStakeChips = {}
All_in_Jest.PolyStakeChip = SMODS.GameObject:extend({
	obj_table = All_in_Jest.PolyStakeChips,
	obj_buffer = {},
	set = "PolyStakeChips",
	required_params = {
		"key",
		"points",
	},
	loc_vars = function(self, info_queue) end,
	unlocked = true,
	point_requirement = 0,
	check_for_unlock = function(self)
		if self.unlocked then
			return true
		end
		if G.PROFILES[G.SETTINGS.profile].all_unlocked then
			return true
		end
		G.PROFILES[G.SETTINGS.profile].aij_poly_chips_unlocked = G.PROFILES[G.SETTINGS.profile].aij_poly_chips_unlocked
			or {}
		if G.PROFILES[G.SETTINGS.profile].aij_poly_chips_unlocked[self.key] then
			return true
		end
		if not G.PROFILES[G.SETTINGS.profile].aij_poly_points then
			return false
		end
		if G.PROFILES[G.SETTINGS.profile].aij_poly_points.points >= self.point_requirement then
			G.PROFILES[G.SETTINGS.profile].aij_poly_chips_unlocked[self.key] = true
			return true
		end
		return false
	end,
	stack = 1,
	inject = function(self) end,
	-- called at the start of the run, 'stack' is the amount it was applied (usually 1)
	apply = function(self, stack) end,
})

function All_in_Jest.create_polychip_alert(chip)
	local t_s = SMODS.create_sprite(0, 0, 1, 1, chip.atlas, chip.pos)

	t_s.states.drag.can = false
	t_s.states.hover.can = false
	t_s.states.collide.can = false

	local t = {
		n = G.UIT.ROOT,
		config = { align = "cl", r = 0.1, padding = 0.06, colour = G.C.UI.TRANSPARENT_DARK },
		nodes = {
			{
				n = G.UIT.R,
				config = {
					align = "cl",
					padding = 0.2,
					minw = 20,
					r = 0.1,
					colour = G.C.BLACK,
					outline = 1.5,
					outline_colour = G.C.GREY,
				},
				nodes = {
					{
						n = G.UIT.R,
						config = { align = "cm", r = 0.1 },
						nodes = {
							{
								n = G.UIT.R,
								config = { align = "cm", r = 0.1 },
								nodes = {
									{ n = G.UIT.O, config = { object = t_s } },
								},
							},
							{
								n = G.UIT.R,
								config = { align = "cm", padding = 0.04 },
								nodes = {
									{
										n = G.UIT.R,
										config = { align = "cm", maxw = 3.4 },
										nodes = {
											{
												n = G.UIT.T,
												config = {
													text = localize("k_stake"),
													scale = 0.5,
													colour = G.C.FILTER,
													shadow = true,
												},
											},
										},
									},
									{
										n = G.UIT.R,
										config = { align = "cm", maxw = 3.4 },
										nodes = {
											{
												n = G.UIT.T,
												config = {
													text = localize("k_unlocked_ex"),
													scale = 0.35,
													colour = G.C.FILTER,
													shadow = true,
												},
											},
										},
									},
								},
							},
						},
					},
				},
			},
		},
	}
	return t
end

function All_in_Jest.unlock_polychip(chip)
	G.E_MANAGER:add_event(
		Event({
			no_delete = true,
			pause_force = true,
			timer = "UPTIME",
			func = function()
				if G.achievement_notification then
					G.achievement_notification:remove()
					G.achievement_notification = nil
				end
				G.achievement_notification = G.achievement_notification
					or UIBox({
						definition = All_in_Jest.create_polychip_alert(chip),
						config = { align = "cr", offset = { x = 20, y = 0 }, major = G.ROOM_ATTACH, bond = "Weak" },
					})
				return true
			end,
		}),
		"achievement"
	)
	G.E_MANAGER:add_event(
		Event({
			no_delete = true,
			trigger = "after",
			pause_force = true,
			timer = "UPTIME",
			delay = 0.1,
			func = function()
				G.achievement_notification.alignment.offset.x = G.ROOM.T.x
					- G.achievement_notification.UIRoot.children[1].children[1].T.w
					- 0.8
				return true
			end,
		}),
		"achievement"
	)
	G.E_MANAGER:add_event(
		Event({
			no_delete = true,
			pause_force = true,
			trigger = "after",
			timer = "UPTIME",
			delay = 0.1,
			func = function()
				play_sound("highlight1", nil, 0.5)
				play_sound("foil2", 0.5, 0.4)
				return true
			end,
		}),
		"achievement"
	)
	G.E_MANAGER:add_event(
		Event({
			no_delete = true,
			pause_force = true,
			trigger = "after",
			delay = 3,
			timer = "UPTIME",
			func = function()
				G.achievement_notification.alignment.offset.x = 20
				return true
			end,
		}),
		"achievement"
	)
	G.E_MANAGER:add_event(
		Event({
			no_delete = true,
			pause_force = true,
			trigger = "after",
			delay = 0.5,
			timer = "UPTIME",
			func = function()
				if G.achievement_notification then
					G.achievement_notification:remove()
					G.achievement_notification = nil
				end
				return true
			end,
		}),
		"achievement"
	)
end

function All_in_Jest.create_polychip_unlock(chip)
	G.your_collection = CardArea(
		G.ROOM.T.x + G.ROOM.T.w / 2,
		G.ROOM.T.h,
		1.5,
		1.5,
		{ card_limit = 2, type = "consumeable", highlight_limit = 0 }
	)

	local chip_card = Card(
		G.your_collection.T.x + G.your_collection.T.w / 2 - G.CARD_W / 2,
		G.your_collection.T.y,
		1.5,
		1.5,
		G.P_CARDS.empty,
		G.P_CENTERS.j_joker,
		{ aij_poly_chip = chip.key }
	)
	chip_card.no_shadow = true
	chip_card.config.center = All_in_Jest.PolyStakeChips[chip.key]
	chip_card.states.drag.can = false
	chip_card.children.center:remove()
	chip_card.children.center =
		SMODS.create_sprite(0, 0, 1, 1, chip.atlas, chip.pos, chip_card.config.center.sprite_args)

	chip_card.children.center.states.hover = chip_card.states.hover
	chip_card.children.center.states.click = chip_card.states.click
	chip_card.children.center.states.drag = chip_card.states.drag
	chip_card.children.center.states.collide.can = false
	chip_card.children.center:set_role({ major = chip_card, role_type = "Glued", draw_major = chip_card })

	local locked_card = Card(
		G.your_collection.T.x + G.your_collection.T.w / 2 - G.CARD_W / 2,
		G.your_collection.T.y,
		1.5,
		1.5,
		G.P_CARDS.empty,
		G.j_locked
	)
	locked_card:remove_UI()
	locked_card.ID = chip_card.ID
	locked_card.children.center:remove()
	locked_card.children.center =
		SMODS.create_sprite(0, 0, 1, 1, "locked_stake", { x = 0, y = 0 }, locked_card.config.center.sprite_args)

	locked_card.children.center.states.hover = locked_card.states.hover
	locked_card.children.center.states.click = locked_card.states.click
	locked_card.children.center.states.drag = locked_card.states.drag
	locked_card.children.center.states.collide.can = false
	locked_card.children.center:set_role({ major = locked_card, role_type = "Glued", draw_major = locked_card })

	locked_card.states.click.can = false
	chip_card.states.click.can = false
	chip_card.states.visible = false
	chip_card.no_ui = true

	G.E_MANAGER:add_event(Event({
		timer = "REAL",
		blockable = false,
		blocking = false,
		func = function()
			G.OVERLAY_MENU.joker_unlock_table = chip_card.ID
			return true
		end,
	}))
	G.E_MANAGER:add_event(
		Event({
			timer = "REAL",
			blockable = false,
			blocking = false,
			trigger = "after",
			delay = 0.6,
			func = function()
				if G.OVERLAY_MENU and G.OVERLAY_MENU.joker_unlock_table == chip_card.ID then
					locked_card:juice_up(0.3, 0.2)
					play_sound("cancel", 0.8)
				end
				return true
			end,
		})
	)
	G.E_MANAGER:add_event(
		Event({
			timer = "REAL",
			blockable = false,
			blocking = false,
			trigger = "after",
			delay = 1.15,
			func = function()
				if G.OVERLAY_MENU and G.OVERLAY_MENU.joker_unlock_table == chip_card.ID then
					locked_card:juice_up(0.45, 0.3)
					play_sound("cancel", 0.92)
				end
				return true
			end,
		})
	)
	G.E_MANAGER:add_event(
		Event({
			timer = "REAL",
			blockable = false,
			blocking = false,
			trigger = "after",
			delay = 1.8,
			func = function()
				if G.OVERLAY_MENU and G.OVERLAY_MENU.joker_unlock_table == chip_card.ID then
					locked_card:juice_up(0.6, 0.4)
					play_sound("cancel", 1.03)
				end
				return true
			end,
		})
	)

	G.E_MANAGER:add_event(Event({
		timer = "REAL",
		blockable = false,
		blocking = false,
		trigger = "after",
		delay = 2.3,
		func = function()
			if G.OVERLAY_MENU and G.OVERLAY_MENU.joker_unlock_table == chip_card.ID then
				locked_card:start_dissolve({ G.C.BLACK })
			end
			return true
		end,
	}))
	G.E_MANAGER:add_event(Event({
		timer = "REAL",
		blockable = false,
		blocking = false,
		trigger = "after",
		delay = 2.7,
		func = function()
			if G.OVERLAY_MENU and G.OVERLAY_MENU.joker_unlock_table == chip_card.ID then
				chip_card:start_materialize({ G.C.BLUE }, true)
				play_sound("crumple1", 0.8, 1)
			end
			return true
		end,
	}))
	G.E_MANAGER:add_event(
		Event({
			timer = "REAL",
			blockable = false,
			blocking = false,
			trigger = "after",
			delay = 2.78,
			func = function()
				if G.OVERLAY_MENU and G.OVERLAY_MENU.joker_unlock_table == chip_card.ID then
					chip_card.no_ui = nil
					play_sound("timpani", 0.8, 1.8)
				end
				return true
			end,
		})
	)
	G.E_MANAGER:add_event(
		Event({
			timer = "REAL",
			blockable = false,
			blocking = false,
			trigger = "after",
			delay = 2.95,
			func = function()
				if G.OVERLAY_MENU and G.OVERLAY_MENU.joker_unlock_table == chip_card.ID then
					play_sound("timpani", 1, 1.8)
				end
				return true
			end,
		})
	)

	G.your_collection:emplace(chip_card)
	G.your_collection:emplace(locked_card)

	local desc_nodes = {}
	localize({
		type = "descriptions",
		set = "PolyStakeChips",
		key = "locked",
		nodes = desc_nodes,
		vars = { chip.point_requirement },
	})

	local t = create_UIBox_generic_options({
		padding = 0,
		back_label = localize("b_continue"),
		no_pip = true,
		snap_back = true,
		back_func = "continue_unlock",
		minw = 4.5,
		contents = {
			{
				n = G.UIT.R,
				config = { align = "cm", padding = 0 },
				nodes = {
					{
						n = G.UIT.R,
						config = { align = "cm", padding = 0.1 },
						nodes = {
							{
								n = G.UIT.R,
								config = { align = "cm", padding = 0.1 },
								nodes = {
									{
										n = G.UIT.R,
										config = { align = "cm", padding = 0 },
										nodes = {
											{
												n = G.UIT.O,
												config = {
													object = DynaText({
														string = { localize("k_stake") },
														colours = { G.C.BLUE },
														shadow = true,
														rotate = true,
														bump = true,
														pop_in = 0.3,
														pop_in_rate = 2,
														scale = 1.2,
													}),
												},
											},
										},
									},
									{
										n = G.UIT.R,
										config = { align = "cm", padding = 0 },
										nodes = {
											{
												n = G.UIT.O,
												config = {
													object = DynaText({
														string = { localize("k_unlocked_ex") },
														colours = { G.C.RED },
														shadow = true,
														rotate = true,
														bump = true,
														pop_in = 0.6,
														pop_in_rate = 2,
														scale = 0.8,
													}),
												},
											},
										},
									},
								},
							},
							{
								n = G.UIT.R,
								config = { align = "cm", padding = 0, draw_layer = 1 },
								nodes = {
									{ n = G.UIT.O, config = { object = G.your_collection } },
								},
							},
							{
								n = G.UIT.R,
								config = { align = "cm", padding = 0.2 },
								nodes = {
									{
										n = G.UIT.R,
										config = {
											align = "cm",
											padding = 0.05,
											emboss = 0.05,
											colour = G.C.WHITE,
											r = 0.1,
										},
										nodes = {
											desc_from_rows(desc_nodes),
										},
									},
								},
							},
						},
					},
				},
			},
		},
	})
	return t
end

local create_unlock_overlay_ref = create_unlock_overlay
function create_unlock_overlay(key)
	if All_in_Jest.PolyStakeChips[key] then
		G.E_MANAGER:add_event(
			Event({
				trigger = "immediate",
				no_delete = true,
				func = function()
					if not G.OVERLAY_MENU then
						G.SETTINGS.paused = true
						G.FUNCS.overlay_menu({
							definition = All_in_Jest.create_polychip_unlock(All_in_Jest.PolyStakeChips[key]),
						})
						play_sound("foil1", 0.7, 0.3)
						play_sound("gong", 1.4, 0.15)
						return true
					end
				end,
			}),
			"unlock"
		)
		return
	end
	create_unlock_overlay_ref(key)
end
