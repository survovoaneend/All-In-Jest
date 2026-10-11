local the_tooth = {
	object_type = "Blind",
	key = "the_tooth_GL",
	boss = {
		min = 3,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "money", "draw_cards" },
	boss_colour = HEX("b52d2d"),
	pos = { x = 0, y = 22 },
	order = 39,
	dollars = 5,

	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		--the animation is a bit weird but it looks kinda cool i think
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
						ease_dollars(-1)
						delay(0.23)
					end
					return true
				end,
			}))
		end
	end,
}
return { name = { "Blinds" }, items = { the_tooth } }
