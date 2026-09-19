local the_life = {
	object_type = "Blind",
	key = "the_life",

	boss = {
		min = 2,
	},
	mult = 2,
	attributes = { "modify_card", "stickers" },
	boss_colour = HEX("507e66"),
	atlas = "blinds",
	pos = { X = 0, y = 54 },
	order = 55,
	dollars = 5,

	calculate = function(self, blind, context)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp then
			return
		end
		if context.before and context.scoring_hand and not temp then
			blind.triggered = true
			for i = 1, #context.scoring_hand do
				-- Don't delay specifically so perishable doesn't tick down after playing hand
				-- context.scoring_hand[i].aij_delay_sticker = context.full_hand[i].aij_delay_sticker or {}
				-- context.scoring_hand[i].aij_delay_sticker["aij_pc_perishable"] = true
				-- context.scoring_hand[i]:set_perishable(true)
				G.E_MANAGER:add_event(Event({
					func = function()
						-- context.scoring_hand[i].aij_delay_sticker["aij_pc_perishable"] = false
						context.scoring_hand[i]:set_perishable(true)
						context.scoring_hand[i]:juice_up()
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
			delay(0.75*1.25)
		end
	end,
}
return { name = { "Blinds" }, items = { the_life } }
