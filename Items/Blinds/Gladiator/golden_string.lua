local golden_string = {
	object_type = "Blind",
	key = "golden_string_GL",
	boss = {
		min = 1,
		showdown = true,
		all_in_jest = {
			gladiator = true,
		},
	},
	in_pool = function(self)
		return true
	end,
	mult = 2,
	attributes = { "lose_economy", "debuff" },
	boss_colour = HEX("efb855"),
	atlas = "blinds_final",
	pos = { y = 11 },
	order = 57,
	dollars = 8,

	loc_vars = function(self)
		return {
			vars = { G.GAME.current_round.aij_golden_string_money },
		}
	end,

	collection_loc_vars = function(self)
		return {
			key = "bl_aij_golden_string_GL_collection",
		}
	end,

	recalc_debuff = function(self, card, from_blind)
		if G.GAME.blind.disabled then
			return false
		end
		if card.area ~= G.jokers then
			if G.GAME.dollars <= G.GAME.current_round.aij_golden_string_money then
				self.triggered = true
				G.GAME.golden_string_recalc_debuff = true
				return true
			else
				return false
			end
		end
	end,

	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.hand_drawn and type(context.hand_drawn) == "table" and #context.hand_drawn > 0 then
			local drawn = context.hand_drawn
			blind.triggered = true
			blind:wiggle()
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					for i = 1, #drawn do
						G.E_MANAGER:add_event(Event({
							func = function()
								if drawn[i] then
									drawn[i]:juice_up()
								end
								return true
							end,
						}))
						ease_dollars(-2)
						G.E_MANAGER:add_event(Event({
							func = function()
								if
									G.GAME.dollars <= G.GAME.current_round.aij_golden_string_money
									and G.GAME.golden_string_recalc_debuff
								then
									G.GAME.golden_string_recalc_debuff = nil
									for _, v in ipairs(G.playing_cards) do
										if G.GAME.blind.config.blind:recalc_debuff(v, nil) then
											v:set_debuff(true)
											if v.debuff then
												v.debuffed_by_blind = true
											end
										else
											v:set_debuff(false)
										end
									end
								end
								return true
							end,
						}))
						delay(0.23)
					end
					return true
				end,
			}))
		end
		if G.GAME.dollars <= G.GAME.current_round.aij_golden_string_money then
			if G.GAME.golden_string_recalc_debuff and G.GAME.blind then
				G.GAME.golden_string_recalc_debuff = nil
				for _, v in ipairs(G.playing_cards) do
					if G.GAME.blind.config.blind:recalc_debuff(v, nil) then
						v:set_debuff(true)
						if v.debuff then
							v.debuffed_by_blind = true
						end
					else
						v:set_debuff(false)
					end
				end
			end
		elseif G.GAME.dollars > G.GAME.current_round.aij_golden_string_money then
			G.GAME.golden_string_recalc_debuff = true
		end
	end,

	defeat = function(self)
		G.GAME.golden_string_recalc_debuff = nil
	end,
}
local get_blind_ref = SMODS.get_new_blind
function SMODS.get_new_blind(blind_type)
	local ret = get_blind_ref(blind_type)
	if ret == "bl_aij_golden_string_GL" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.current_round.aij_golden_string_money = math.floor(G.GAME.dollars)
				return true
			end,
		}))
	end
	return ret
end
return { name = { "Finisher Blinds" }, items = { golden_string } }
