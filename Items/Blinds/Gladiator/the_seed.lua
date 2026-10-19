local the_seed = {
	object_type = "Blind",
	key = "the_seed_GL",

	boss = {
		min = 1,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = {},
	boss_colour = HEX("d4ccbc"),
	atlas = "blinds",
	pos = { X = 0, y = 85 },
	order = 44,
	dollars = 5,

	in_pool = function(self)
		return (G.GAME.round_resets.ante % G.GAME.win_ante) ~= (G.GAME.win_ante - 1)
	end,

	defeat = function(self)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp then
			return
		end
		G.GAME.aij_has_big_boss = true
		G.GAME.aij_big_boss_reset_ante = true
		G.GAME.aij_seed_GL = true
		G.GAME.round_resets.blind_choices.Big_Boss = SMODS.get_new_blind("big_boss")
	end,
}

local is_showdown_ref = SMODS.is_showdown_ante
function SMODS.is_showdown_ante()
	if G.GAME.aij_seed_GL and not G.GAME.aij_polling_big_boss then
		return true
	end
	return is_showdown_ref()
end
local ease_ante_ref = ease_ante
function ease_ante(mod)
	if SMODS.ante_end then
		G.GAME.aij_seed_GL = nil
	end
	return ease_ante_ref(mod)
end

return { name = { "Blinds" }, items = { the_seed } }
