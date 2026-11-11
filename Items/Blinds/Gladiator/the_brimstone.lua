local the_brimstone = {
	object_type = "Blind",
	key = "the_brimstone_GL",
	boss = {
		min = 3,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "discard", "lose_economy" },
	boss_colour = HEX("f24949"),
	atlas = "blinds",
	pos = { X = 0, y = 8 },
	order = 41,
	dollars = 5,

	loc_vars = function(self)
		return {
			vars = { G.GAME.current_round.aij_the_brimstone_money },
		}
	end,

	collection_loc_vars = function(self)
		return {
			key = "bl_aij_the_brimstone_GL_collection",
		}
	end,

	calculate = function(self, blind, context)
		if context.pre_discard and not G.GAME.blind.disabled and G.GAME.dollars > 0 then
			blind.triggered = true
			blind:wiggle()
			ease_dollars(-G.GAME.current_round.aij_the_brimstone_money, true)
		end
	end,
}
local get_blind_ref = SMODS.get_new_blind
function SMODS.get_new_blind(blind_type)
	local ret = get_blind_ref(blind_type)
	if ret == "bl_aij_the_brimstone_GL" then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.current_round.aij_the_brimstone_money = math.floor(G.GAME.dollars * 0.5)
				return true
			end,
		}))
	end
	return ret
end
return { name = { "Blinds" }, items = { the_brimstone } }
