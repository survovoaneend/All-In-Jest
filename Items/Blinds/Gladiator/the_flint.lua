local the_flint = {
	object_type = "Blind",
	key = "the_flint_GL",
	boss = {
		min = 2,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "hand_level" },
	boss_colour = HEX("e56a2f"),
    pos = { x = 0, y = 24 },
	order = 17,
	dollars = 5,

	set_blind = function(self)
		G.GAME.aij_rubber_duck_hand_stats = {}
		for k, v in pairs(G.GAME.hands) do
			G.GAME.aij_rubber_duck_hand_stats[k] = SMODS.shallow_copy(v)
			v.chips = v.s_chips - v.l_chips
		end
	end,

	disable = function(self)
		local newer_stats = {}
		for k, v in pairs(G.GAME.hands) do
			newer_stats[k] = SMODS.shallow_copy(v)
			newer_stats[k].chips = newer_stats[k].chips - v.s_chips
		end
		for k, v in pairs(G.GAME.aij_rubber_duck_hand_stats) do
			G.GAME.hands[k] = v
		end
		for k, v in pairs(newer_stats) do
			G.GAME.hands[k].chips = G.GAME.hands[k].chips + newer_stats[k].chips
		end
		G.GAME.aij_rubber_duck_hand_stats = nil
	end,

	defeat = function(self)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp then
			return
		end
		local newer_stats = {}
		for k, v in pairs(G.GAME.hands) do
			newer_stats[k] = SMODS.shallow_copy(v)
			newer_stats[k].chips = newer_stats[k].chips - v.s_chips
		end
		for k, v in pairs(G.GAME.aij_rubber_duck_hand_stats) do
			G.GAME.hands[k] = v
		end
		for k, v in pairs(newer_stats) do
			G.GAME.hands[k].chips = G.GAME.hands[k].chips + newer_stats[k].chips
		end
		G.GAME.aij_rubber_duck_hand_stats = nil
	end,
}
return { name = { "Blinds" }, items = { the_flint } }
