local the_life = {
	object_type = "Blind",
	key = "the_life_GL",
	boss = {
		min = 2,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "modify_card", "stickers" },
	boss_colour = HEX("507e66"),
	atlas = "blinds",
	pos = { x = 0, y = 54 },
	order = 48,
	dollars = 5,

	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.before and context.full_hand then
			blind.triggered = true
			for i = 1, #context.full_hand do
				local card = context.full_hand[i]
				G.E_MANAGER:add_event(Event({
					func = function()
						card:set_perishable(true)
						card:juice_up()
						return true
					end,
				}))
			end
			G.E_MANAGER:add_event(Event({
				func = function()
					blind:wiggle()
					return true
				end,
			}))
			delay(0.75 * 1.25)
		end
	end,
}
return { name = { "Blinds" }, items = { the_life } }