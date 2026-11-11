local silhouette_shader = {
	object_type = "Shader",
	key = "silhouette",
	path = "silhouette.fs",
}

local guess_the_jest = {
	object_type = "Booster",
	order = 5,
	key = "guess_the_jest",
	atlas = "booster_atlas",
	pos = { x = 0, y = 0 },
	cost = 20,
	weight = 0.05,
	config = { extra = 3, choose = 1 },
	attributes = { "joker", "rarity", "legendary" },
	discovered = false,
	unlocked = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.choose, card.ability.extra } }
	end,
	ease_background_colour = function(self)
		ease_background_colour_blind(G.STATES.SPECTRAL_PACK)
	end,
	particles = function(self)
		G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
			timer = 0.015,
			scale = 0.1,
			initialize = true,
			lifespan = 3,
			speed = 0.2,
			padding = -1,
			attach = G.ROOM_ATTACH,
			colours = { G.C.WHITE, lighten(G.C.GOLD, 0.2) },
			fill = true,
		})
		G.booster_pack_sparkles.fade_alpha = 1
		G.booster_pack_sparkles:fade(1, 0)
	end,
	get_weight = function(self)
		local has_whatsisname = next(SMODS.find_card("j_aij_whatsisname"))
		if has_whatsisname then
			return 0.05 + 0.1 * #SMODS.find_card("j_aij_whatsisname")
		else
			return 0.05
		end
	end,
	create_card = function(self, card, i)
		local card_params = {
			set = "Joker",
			legendary = true,
			area = G.pack_cards,
			skip_materialize = true,
			soulable = false,
			key_append = "leg_guess",
			no_edition = true,
		}
		local _card = SMODS.create_card(card_params)
		if _card then
			_card.ability = _card.ability or {}
			_card.ability.from_guess_the_jest = true
			_card.ability.background = tostring(math.random(1, 4))
			for k, v in pairs(G.shared_stickers) do
				if _card.ability[k] then
					_card.ability[k] = false
				end
			end
		end
		return _card
	end,
	group_key = "k_aij_guess_the_jest",
}

local aij_generate_card_ui_ref = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
	local ret
	if card and card.ability and card.ability.from_guess_the_jest then
		ret = aij_generate_card_ui_ref(
			{ key = "guess_the_jest_hidden", set = "Other", vars = {} },
			full_UI_table,
			nil,
			"Other",
			badges,
			false,
			main_start,
			main_end,
			card
		)
		if All_in_Jest.config.guess_names then
			local name_ret = aij_generate_card_ui_ref(
				_c,
				full_UI_table,
				specific_vars,
				card_type,
				badges,
				hide_desc,
				main_start,
				main_end,
				card
			)
			ret.name = name_ret.name
		end
	else
		if
			card
			and _c.rarity == 4
			and G.STATE == G.STATES.SMODS_BOOSTER_OPENED
			and SMODS.OPENED_BOOSTER
			and SMODS.OPENED_BOOSTER.config.center.key == "p_aij_guess_the_jest"
			and card.area
			and card.area.config.collection
		then
			ret = aij_generate_card_ui_ref(
				_c,
				full_UI_table,
				specific_vars,
				card_type,
				badges,
				hide_desc,
				main_start,
				main_end,
				card
			)
			local name_ret = aij_generate_card_ui_ref(
				{ key = "guess_the_jest_hidden", set = "Other", vars = {} },
				full_UI_table,
				nil,
				"Other",
				badges,
				false,
				main_start,
				main_end,
				card
			)
			ret.name = name_ret.name
		else
			ret = aij_generate_card_ui_ref(
				_c,
				full_UI_table,
				specific_vars,
				card_type,
				badges,
				hide_desc,
				main_start,
				main_end,
				card
			)
		end
	end
	return ret
end

local background_draw_step = {
	object_type = "DrawStep",
	key = "guess_the_jest_background",
	order = 2,
	func = function(self, layer)
		if self.ability.set == "Joker" and self.ability.from_guess_the_jest then
			G.AIJ.shared_mystery_sprites["bg" .. self.ability.background].role.draw_major = self
			G.AIJ.shared_mystery_sprites["bg" .. self.ability.background]:draw_shader(
				"dissolve",
				nil,
				nil,
				nil,
				self.children.center
			)
		end
	end,
	conditions = { vortex = false, facing = "front" },
}
local silhouette_draw_step = {
	object_type = "DrawStep",
	key = "silhouette",
	order = 65,
	func = function(self, layer)
		local scale_mod = 0.07
			+ 0.02 * math.sin(1.8 * G.TIMERS.REAL)
			+ 0.00
				* math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) * math.pi * 14)
				* (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
		local rotate_mod = 0.05 * math.sin(1.219 * G.TIMERS.REAL)
			+ 0.00 * math.sin(G.TIMERS.REAL * math.pi * 5) * (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 2
		if self.config.center.soul_pos and self.ability.from_guess_the_jest then
			self.children.floating_sprite:draw_shader(
				"aij_silhouette",
				nil,
				self.ARGS.send_to_shader,
				nil,
				self.children.center,
				scale_mod,
				rotate_mod
			)
		end
	end,
	conditions = { vortex = false, facing = "front" },
}
return {
	name = { "Boosters" },
	items = { guess_the_jest, silhouette_shader, background_draw_step, silhouette_draw_step },
}
