local the_pear = {
	object_type = "Blind",
	key = "the_pear_GL",
	boss = {
		min = 3,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "modify_card", "rank", "suit" },
	boss_colour = HEX("84b1d2"),
	atlas = "blinds",
	pos = { X = 0, y = 34 },
	order = 46,
	dollars = 5,

	calculate = function(self, blind, context)
		if context.after and not blind.disabled then
			G.E_MANAGER:add_event(Event({
				func = function()
					for i = 1, #G.play.cards do
						G.play.cards[i]:flip()
					end
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 1,
				func = function()
					blind:wiggle()
					for i = 1, #G.play.cards do
						G.play.cards[i]:juice_up(0.3, 0.3)
					end
					return true
				end,
			}))
			delay(0.4)
			for i = 1, #G.play.cards do
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.1,
					func = function()
						G.play.cards[i]:set_base(pseudorandom_element(G.P_CARDS, pseudoseed("the_pear")))
						G.play.cards[i]:flip()
						return true
					end,
				}))
			end
			delay(1.6)
		end
	end,
}
return { name = { "Blinds" }, items = { the_pear } }
