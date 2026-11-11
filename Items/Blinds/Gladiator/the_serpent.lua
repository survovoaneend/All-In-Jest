local the_serpent = {
	object_type = "Blind",
	key = "the_serpent_GL",
	boss = {
		min = 5,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "draw_cards" },
	boss_colour = HEX("439a4f"),
	pos = { x = 0, y = 15 },
	order = 30,
	dollars = 5,
	modifies_draw = true,

	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if
			context.drawing_cards
			and (G.GAME.current_round.hands_played ~= 0 or G.GAME.current_round.discards_used ~= 0)
		then
			return { cards_to_draw = math.min(context.amount or 3, 3) }
		end
	end,
}
return { name = { "Blinds" }, items = { the_serpent } }
