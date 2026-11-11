local the_beast = {
	object_type = "Blind",
	key = "the_beast_GL",
	boss = {
		min = 3,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "destroy_card", "joker" },
	boss_colour = HEX("4a834c"),
	atlas = "blinds",
	pos = { X = 0, y = 36 },
	order = 36,
	dollars = 5,

	calculate = function(self, blind, context)
		if context.aij_before_before and not blind.disabled then
			local jokers_to_destroy = {}
			for i = 1, #G.jokers.cards do
				if All_in_Jest.is_food(G.jokers.cards[i]) then
					table.insert(jokers_to_destroy, G.jokers.cards[i])
				end
			end
			if #jokers_to_destroy > 0 then
				blind.triggered = true
				blind:wiggle()
				SMODS.destroy_cards(jokers_to_destroy, { immediate = true })
			end
		end
	end,
	in_pool = function(self)
		if G.jokers then
			for i = 1, #G.jokers.cards do
				if All_in_Jest.is_food(G.jokers.cards[i]) then
					return true
				end
			end
			return false
		end
	end,
}
return { name = { "Blinds" }, items = { the_beast } }
