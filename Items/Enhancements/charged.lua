local charged = {
	object_type = "Enhancement",
	key = "charged",
	atlas = "enhancements_atlas",

	order = 2,
	pos = { x = 2, y = 0 },
	config = {},
	all_in_jest = {
		multi_enhancement_z_order = 1,
	},
	loc_vars = function(self, info_queue, card)
		local charged_text
		local founding_father_count = #SMODS.find_card("j_aij_founding_father")
		charged_text = 50 * (2 ^ (founding_father_count))
		return { vars = { charged_text } }
	end,
	calculate = function(self, card, context)
		-- There isn't even any code here T_T
	end,
}

local updateref = Card.update
function Card:update(dt)
	local ref = updateref(self, dt)
	if self.config.center == G.P_CENTERS.c_base then
		return ref
	end

	local current_count = 0
	if self.area == G.play and G.play then
		for _, c in ipairs(G.play.cards) do
			if c.config and SMODS.has_enhancement(c, "m_aij_charged") and not c.debuff then
				current_count = current_count + 1
			end
		end
	end
	if self.area == G.hand and G.hand then
		local is_highlighted = {}
		for _, c in ipairs(G.hand.highlighted) do
			is_highlighted[c] = true
		end
		local self_is_highlighted = is_highlighted[self]

		for _, c in ipairs(G.hand.cards) do
			if c.config and SMODS.has_enhancement(c, "m_aij_charged") and not c.debuff then
				if is_highlighted[c] == self_is_highlighted then
					current_count = current_count + 1
				end
			end
		end
	end

	local applied = self.ability.jest_charged_applied or {}
	self.ability.jest_charged_applied = applied
	local prev_factor = applied.factor or 1
	local founding_father_count = #SMODS.find_card("j_aij_founding_father")
	local b = (2 ^ (founding_father_count - 1)) -- base of exponential
	local factor = 1 + (b * current_count)
	local diff = factor / prev_factor

	if diff ~= 1 then
		local function extract_keys(tbl, ret)
			if type(tbl) ~= "table" then
				return
			end
			for k, v in pairs(tbl) do
				table.insert(ret, k)
				if type(v) == "table" then
					extract_keys(v. ret)
				end
			end
		end

		for extra_search, enhancement_key in pairs({
			["ability"] = self.config.center and self.config.center.key,
			["config.aij_other_center.ability"] = self.config.aij_other_center and self.config.aij_other_center.center and self.config.aij_other_center.center.key,
		}) do

			sendDebugMessage(enhancement_key, "AIJ")

			local inherent_keys = {}
			if enhancement_key then
				extract_keys(G.P_CENTERS[enhancement_key].config, inherent_keys)
				if #inherent_keys > 0 then
					jest_ability_calculate(self, "*", diff, {
						h_x_chips = 1,
						Xmult = 1,
						x_chips = 1,
						x_mult = 1,
						extra_value = true,
						card_limit = true,
						-- new SMODS stuff
						bonus_x_score = 1,
						bonus_h_x_score = 1,
						bonus_x_blind_size = 1,
						bonus_h_x_blind_size = 1,
					}, inherent_keys, true, true, extra_search)
				end
			end
		end

		applied.factor = factor
	end
	return ref
end

return { name = { "Enhancements" }, items = { charged } }
