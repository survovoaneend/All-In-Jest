local the_solid = {
	object_type = "Blind",
	key = "the_solid_GL",

	boss = {
		min = 3,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "modify_card", "stickers" },
	boss_colour = HEX("6f7070"),
	atlas = "blinds",
	pos = { X = 0, y = 68 },
	order = 49,
	dollars = 5,

	calculate = function(self, blind, context)
		if context.before and not blind.disabled then
			blind.triggered = true
			for i = 1, #context.full_hand do
				local scoring = false
				for j = 1, #context.scoring_hand do
					if context.full_hand[i] == context.scoring_hand[j] then
						scoring = true
						break
					end
				end
				if not scoring then
					context.full_hand[i].aij_delay_sticker = context.full_hand[i].aij_delay_sticker or {}
					context.full_hand[i].aij_delay_sticker["aij_pc_eternal"] = true
					context.full_hand[i]:set_eternal(true)
					G.E_MANAGER:add_event(Event({
						func = function()
							context.full_hand[i].aij_delay_sticker["aij_pc_eternal"] = nil
							context.full_hand[i]:juice_up()
							return true
						end,
					}))
				end
			end
			G.E_MANAGER:add_event(Event({
				func = function()
					blind:wiggle()
					return true
				end,
			}))
			delay(0.75 * 1.25)
		end
		if context.pre_discard and not blind.disabled then
			blind.triggered = true
			for i = 1, #context.full_hand do
				context.full_hand[i].aij_delay_sticker = context.full_hand[i].aij_delay_sticker or {}
				context.full_hand[i].aij_delay_sticker["aij_pc_eternal"] = true
				context.full_hand[i]:set_eternal(true)
				G.E_MANAGER:add_event(Event({
					func = function()
						context.full_hand[i].aij_delay_sticker["aij_pc_eternal"] = nil
						context.full_hand[i]:juice_up()
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
return { name = { "Blinds" }, items = { the_solid } }
