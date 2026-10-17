local lunar = {
	object_type = "Enhancement",
	key = "lunar",
	atlas = "enhancements_atlas",
	order = 9,
	pos = { x = 7, y = 5 },
	-- no_collection = true,
	config = {
		extra = {},
	},
	all_in_jest = {
		multi_enhancement_z_order = -1,
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
	never_scores = true,
	calculate = function(self, card, context)
		if card.area == G.play and context.modify_hand then
			local chip_val = card:get_chip_bonus()
			SMODS.upgrade_poker_hands({
				hands = context.scoring_name,
				func = function(base, hand, parameter, level_up)
					return base + chip_val
				end,
				level_up = 0,
				from = card,
				instant = nil,
				parameters = { "chips" },
			})
			hand_chips = mod_chips(hand_chips + chip_val)
		end
	end,

	in_pool = function(self, args)
		return G.GAME and G.GAME.all_in_jest and G.GAME.all_in_jest.weird_enhancements
	end,
}

function process_texture_lunar(image, high_contrast)
	local width, height = image:getDimensions()
	local canvas =
		love.graphics.newCanvas(width, height, { type = "2d", readable = true, dpiscale = image:getDPIScale() })

	love.graphics.push("all")

	love.graphics.setCanvas(canvas)
	local lunar_bg_colour = { 210 / 255, 214 / 255, 216 / 255, 0 }
	love.graphics.clear(lunar_bg_colour)

	love.graphics.setColor(1, 1, 1, 1)

	G.SHADERS["aij_lunar_spritesheet"]:send("image_dims", { image:getDimensions() })
	love.graphics.setShader(G.SHADERS["aij_lunar_spritesheet"])

	-- Draw image with lunar shader on new canvas
	love.graphics.draw(image)

	love.graphics.pop()

	image_data = canvas:newImageData()

	return love.graphics.newImage(image_data, { mipmaps = true, dpiscale = image:getDPIScale() }), image_data
end

function pre_lunared(a, high_contrast)
	local atlas = a.name or a.key
	local name = atlas .. "_lunared"
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

function lunar_atlas(a, high_contrast)
	local lunared = pre_lunared(a, high_contrast)

	if not lunared.atlas then
		local atlas_type = a.atlas_table or "ASSET_ATLAS"
		G[atlas_type][lunared.new_name] = {}
		SMODS.get_atlas(lunared.new_name).lunar = true
		if high_contrast then
			SMODS.get_atlas(lunared.new_name).name = SMODS.get_atlas(lunared.old_name).name .. "_lunared_hc"
		else
			SMODS.get_atlas(lunared.new_name).name = SMODS.get_atlas(lunared.old_name).name .. "_lunared"
		end
		SMODS.get_atlas(lunared.new_name).type = SMODS.get_atlas(lunared.old_name).type
		SMODS.get_atlas(lunared.new_name).px = SMODS.get_atlas(lunared.old_name).px
		SMODS.get_atlas(lunared.new_name).py = SMODS.get_atlas(lunared.old_name).py
		SMODS.get_atlas(lunared.new_name).frames = SMODS.get_atlas(lunared.old_name).frames

		image, image_data = process_texture_lunar(SMODS.get_atlas(lunared.old_name).image, high_contrast)
		SMODS.get_atlas(lunared.new_name).image = image
		SMODS.get_atlas(lunared.new_name).image_data = image_data
	end

	return SMODS.get_atlas(lunared.new_name)
end

return { name = { "Enhancements" }, items = { lunar } }
