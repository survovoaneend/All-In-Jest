local the_need = {
	object_type = "Blind",
	key = "the_need_GL",
	in_pool = function(self)
		if G.GAME.dollars and G.GAME.dollars >= 20 then
			return true
		else
			return false
		end
	end,
	boss = {
		min = 3,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = {},
	boss_colour = HEX("98c350"),
	atlas = "blinds",
	pos = { X = 0, y = 11 },
	order = 37,
	dollars = 5,

	loc_vars = function(self)
		return {
			vars = { G.GAME.current_round.aij_the_need_money },
		}
	end,

	collection_loc_vars = function(self)
		return {
			key = 'bl_aij_the_need_GL_collection',
		}
	end,

	calculate = function(self, blind, context) end,
	debuff_hand = function(self, cards, hand, handname, check)
		if G.GAME.dollars >= G.GAME.current_round.aij_the_need_money then
			return false
		else
			G.GAME.blind.triggered = true
			return true
		end
	end,
}
local get_blind_ref = SMODS.get_new_blind
function SMODS.get_new_blind(blind_type)
	local ret = get_blind_ref(blind_type)
	if ret == 'bl_aij_the_need_GL' then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.current_round.aij_the_need_money = math.floor(G.GAME.dollars * 1.5)
				return true
			end,
		}))
	end
	return ret
end
return { name = { "Blinds" }, items = { the_need } }
