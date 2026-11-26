local the_bird = {
	object_type = "Blind",
	key = "the_bird",
	boss = {
		all_in_jest = {
			pit = true,
		},
	},
	lite = true,
	in_pool = function(self)
		return All_in_Jest.pit_blinds_in_play()
	end,
	mult = 2,
	attributes = { "joker" },
	boss_colour = HEX("c7b28c"),
	atlas = "blinds_pit",
	pos = { y = 11 },
	order = 512,
	dollars = 6,

	calculate = function(self, blind, context)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp then
			return
		end

		if context.before and G.jokers.cards and not temp then
			blind.triggered = false
			local joker_count = #G.jokers.cards
			if joker_count > 1 then
				blind.triggered = true
				local joker = pseudorandom_element(G.jokers.cards, "tbjk")
				local old_index = 0
				for i = 1, joker_count do
					if joker == G.jokers.cards[i] then
						old_index = i
					end
				end
				local new_index = pseudorandom("bl_aij_the_bird", 1, joker_count - 1)
				if new_index >= old_index then
					new_index = new_index + 1
				end
				G.E_MANAGER:add_event(Event({
					type = "after",
					delay = 0.2,
					func = function()
						blind:wiggle()
						table.remove(G.jokers.cards, old_index)
						table.insert(G.jokers.cards, math.min(new_index, joker_count), joker)
						play_sound("cardSlide1", 0.85)
						return true
					end,
				}))
				delay(0.2)
			end
		end
	end,
}
return { name = { "Pit Blinds" }, items = { the_bird } }
