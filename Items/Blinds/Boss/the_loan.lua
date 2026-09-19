local the_loan = {
	object_type = "Blind",
	key = "the_loan",

	boss = {
		min = 4,
	},
	mult = 2,
	attributes = { "modify_card", "stickers" },
	boss_colour = HEX("e8a94f"),
	atlas = "blinds",
	pos = { X = 0, y = 70 },
	order = 71,
	dollars = 5,

	calculate = function(self, blind, context)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp then
			return
		end

		if context.before and G.hand.cards and not temp then
			for i = 1, #G.play.cards do
				if
					G.play.cards[i].config.center ~= G.P_CENTERS.c_base
					or G.play.cards[i].edition ~= nil
					or G.play.cards[i].seal ~= nil
				then
					blind.triggered = true
					break
				end
			end
		end

		if context.all_in_jest and context.all_in_jest.before_after then
			local chipsthing = G.GAME.chips + context.total_chips >= G.GAME.blind.chips
			if chipsthing then
				blind.triggered = true
				for i = 1, #context.full_hand do
					local card = context.full_hand[i]
					if card and not card.getting_sliced then
						G.E_MANAGER:add_event(Event({
							func = function()
								card:set_rental(true)
								card:juice_up()
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
				delay(0.75*1.25)
			end
		end
	end,
}
return { name = { "Blinds" }, items = { the_loan } }
