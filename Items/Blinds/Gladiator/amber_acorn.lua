local amber_acorn = {
	object_type = "Blind",
	key = "amber_acorn_GL",
	boss = {
		showdown = true,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "position" },
	boss_colour = HEX("fda200"),
	pos = { x = 0, y = 27 },
	order = 51,
	dollars = 8,
	
	press_play = function(self)
		if G.GAME.blind.disabled then return end
		G.E_MANAGER:add_event(Event({
			trigger = "immediate",
			func = function()
				local shuffle_jokers = #G.jokers.cards > 1
				local shuffle_played = #G.play.cards > 1
				if shuffle_jokers or shuffle_played then
					G.E_MANAGER:add_event(Event({
						trigger = "immediate",
						func = function()
							if shuffle_jokers then
								G.jokers:shuffle("acorn_GL")
							end
							if shuffle_played then
								G.play:shuffle("acorn_GL_play")
							end
							play_sound("cardSlide1", 0.85)
							return true
						end,
					}))

					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.2,
						func = function()
							if shuffle_jokers then
								G.jokers:shuffle("acorn_GL")
							end
							if shuffle_played then
								G.play:shuffle("acorn_GL_play")
							end
							play_sound("cardSlide1", 1.15)
							return true
						end,
					}))

					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.2,
						func = function()
							if shuffle_jokers then
								G.jokers:shuffle("acorn_GL")
							end
							if shuffle_played then
								G.play:shuffle("acorn_GL_play")
							end
							play_sound("cardSlide1", 1)
							return true
						end,
					}))
				end
				return true
			end,
		}))
	end,
}
return { name = { "Blinds" }, items = { amber_acorn } }
