local lost_carcosa = {
	object_type = "Joker",
	order = 207,

	key = "lost_carcosa",
	config = {
		extra = {
			min = 50,
			max = 200,
		},
	},
	attributes = { "planet", "consumable" },
	rarity = 2,
	pos = { x = 16, y = 7 },
	atlas = "joker_atlas",
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,

	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.min, card.ability.extra.max } }
	end,

	calculate = function(self, card, context)
		if context.all_in_jest and context.all_in_jest.before_using_consumeable then
			if context.all_in_jest.consumeable.ability.set == "Planet" then
				local mult = pseudorandom("aij_lost_carcosa", card.ability.extra.min, card.ability.extra.max)
				mult = math.floor(mult / 5 + 0.5) * 5 -- Round to nearest 5%
				G.GAME.all_in_jest.apply.lost_carcosa_mult = G.GAME.all_in_jest.apply.lost_carcosa_mult * mult * 0.01
				local string = tostring(mult) .. "%"
				-- card_eval_status_text(card, 'extra', nil, nil, nil, {message = string, colour = G.C.SECONDARY_SET.Planet})
				return {
					message = string,
					colour = G.C.SECONDARY_SET.Planet,
				}
			end
		end

		if context.using_consumeable and not context.blueprint then
			G.GAME.all_in_jest.apply.lost_carcosa_mult = 1
		end
	end,
}

local function round_int(x)
	return x >= 0 and math.floor(x + 0.5) or math.ceil(x - 0.5)
end

local aij_smods_upgrade_poker_hands_ref = SMODS.upgrade_poker_hands
function SMODS.upgrade_poker_hands(args)
	if args.func and type(args.func) == "function" then
		local orig_func = args.func
		local func_wrapper = function(base, hand, parameter, level_up)
			return round_int(orig_func(base, hand, parameter, level_up * G.GAME.all_in_jest.apply.lost_carcosa_mult))
		end
		args.func = func_wrapper
	end

	local ret = aij_smods_upgrade_poker_hands_ref(args)

	return ret
end

return { name = { "Jokers" }, items = { lost_carcosa } }
