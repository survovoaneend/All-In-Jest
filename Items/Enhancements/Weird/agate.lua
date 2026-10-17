local agate = {
	object_type = "Enhancement",
	key = "agate",
	atlas = "enhancements_atlas",
	order = 10,
	pos = { x = 8, y = 5 },
	-- no_collection = true,
	config = {
		extra = {
			Diamonds = {
				return_values = {
					dollars = 1,
				},
			},
			Hearts = {
				odds = 2,
				return_values = {
					xmult = 1.5,
				},
			},
			Clubs = {
				return_values = {
					mult = 7,
				},
			},
			Spades = {
				return_values = {
					chips = 50,
				},
			},
			paperback_Crowns = {
				odds = 3,
			},
			paperback_Stars = {
				xchips_mod = 0.2,
			},
			bunc_Halberds = {
				return_values = {
					chips = 30,
					mult = 6,
				},
			},
			bunc_Fleurons = {
				odds = 7,
			},
		},
	},
	all_in_jest = {
		multi_enhancement_z_order = -1,
	},
	loc_vars = function(self, info_queue, card)
		for suit, suit_effect in pairs(card.ability.extra) do
			if card:is_suit(suit) and suit_effect then
				local info_queue_vars = {}

				for k, v in pairs(suit_effect) do
					if k == "return_values" then
					elseif k == "odds" then
						local numerator, denominator = SMODS.get_probability_vars(card, 1, v, "agate_" .. suit)
						table.insert(info_queue_vars, numerator)
						table.insert(info_queue_vars, denominator)
					elseif type(v) == "number" then
						table.insert(info_queue_vars, v)
					end
				end

				if suit_effect.return_values then
					for k, v in pairs(suit_effect.return_values) do
						if type(v) == "number" then
							table.insert(info_queue_vars, v)
						end
					end
				end

				info_queue[#info_queue + 1] = { set = "Other", key = "m_aij_agate_" .. suit, vars = info_queue_vars}
			end
		end
		return {
			vars = {},
		}
	end,
	calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			local return_table = {}
			for suit, suit_effect in pairs(card.ability.extra) do
				if card:is_suit(suit) and suit_effect then
					local triggers = true
					if suit_effect.odds then
						triggers = SMODS.pseudorandom_probability(card, "agate_" .. suit, 1, suit_effect.odds)
					end
					if triggers then
						if suit_effect.return_values then
							for k, v in pairs(suit_effect.return_values) do
								return_table[k] = return_table[k] or 0
								return_table[k] = return_table[k] + v
							end
						-- These have dynamic return values
						elseif card:is_suit("paperback_Crowns") then
							G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
							return_table.extra = {
								message = localize("k_plus_tarot"),
								pre_func = function()
									G.E_MANAGER:add_event(Event({
										trigger = "before",
										delay = 0.0,
										func = function()
											SMODS.add_card({
												set = "Tarot",
												area = G.consumeables,
												key_append = "agate",
											})
											G.GAME.consumeable_buffer = 0
											return true
										end,
									}))
								end,
								colour = G.C.SECONDARY_SET.Tarot,
							}
						elseif card:is_suit("paperback_Stars") then
							local stars = 0
							for _, v in ipairs(context.full_hand) do
								if v:is_suit("paperback_Stars") and v ~= card then
									stars = stars + 1
								end
							end
							if stars > 0 then
								return_table["x_chips"] = return_table["x_chips"] or 0
								return_table["x_chips"] = return_table["x_chips"] + 1 + suit_effect.xchips_mod * stars
							end
						elseif card:is_suit("bunc_Fleurons") then
							local value = card:get_chip_bonus()
							return_table["dollars"] = return_table["dollars"] or 0
							return_table["dollars"] = return_table["dollars"] + value
						end
					end
				end
			end
			return return_table
		end
	end,

	in_pool = function(self, args)
		return G.GAME and G.GAME.all_in_jest and G.GAME.all_in_jest.weird_enhancements
	end,
}

function process_texture_agate(image, high_contrast)
	local width, height = image:getDimensions()
	local canvas =
		love.graphics.newCanvas(width, height, { type = "2d", readable = true, dpiscale = image:getDPIScale() })

	love.graphics.push("all")

	love.graphics.setCanvas(canvas)
	local agate_bg_colour = { 79 / 255, 99 / 255, 103 / 255, 0 }
	love.graphics.clear(agate_bg_colour)

	love.graphics.setColor(1, 1, 1, 1)

	G.SHADERS["aij_agate_spritesheet"]:send("image_dims", { image:getDimensions() })
	love.graphics.setShader(G.SHADERS["aij_agate_spritesheet"])

	-- Draw image with agate shader on new canvas
	love.graphics.draw(image)

	love.graphics.pop()

	image_data = canvas:newImageData()

	return love.graphics.newImage(image_data, { mipmaps = true, dpiscale = image:getDPIScale() }), image_data
end

function pre_agateed(a, high_contrast)
	local atlas = a.name or a.key
	local name = atlas .. "_agateed"
	if high_contrast then
		name = name .. "_hc"
	end
	if SMODS.get_atlas(name) then
		return {
			old_name = atlas,
			new_name = name,
			atlas = SMODS.get_atlas(name),
		}
	else
		return {
			old_name = atlas,
			new_name = name,
			atlas = nil,
		}
	end
end

function agate_atlas(a, high_contrast)
	local agateed = pre_agateed(a, high_contrast)

	if not agateed.atlas then
		local atlas_type = a.atlas_table or "ASSET_ATLAS"
		G[atlas_type][agateed.new_name] = {}
		SMODS.get_atlas(agateed.new_name).agate = true
		if high_contrast then
			SMODS.get_atlas(agateed.new_name).name = SMODS.get_atlas(agateed.old_name).name .. "_agateed_hc"
		else
			SMODS.get_atlas(agateed.new_name).name = SMODS.get_atlas(agateed.old_name).name .. "_agateed"
		end
		SMODS.get_atlas(agateed.new_name).type = SMODS.get_atlas(agateed.old_name).type
		SMODS.get_atlas(agateed.new_name).px = SMODS.get_atlas(agateed.old_name).px
		SMODS.get_atlas(agateed.new_name).py = SMODS.get_atlas(agateed.old_name).py
		SMODS.get_atlas(agateed.new_name).frames = SMODS.get_atlas(agateed.old_name).frames

		image, image_data = process_texture_agate(SMODS.get_atlas(agateed.old_name).image, high_contrast)
		SMODS.get_atlas(agateed.new_name).image = image
		SMODS.get_atlas(agateed.new_name).image_data = image_data
	end

	return SMODS.get_atlas(agateed.new_name)
end

return { name = { "Enhancements" }, items = { agate } }
