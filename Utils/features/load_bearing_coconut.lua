function load_coconut_card_area(game)
	game.aij_coconut_holder = CardArea(
		game.jokers.T.x + 12.5,
		game.jokers.T.y - 4,
		game.jokers.T.w / 5,
		game.jokers.T.h,
		{ card_limit = 1, type = "joker", highlight_limit = 1 }
	)

	SMODS.create_card_scale = SMODS.create_card_scale or { w = 1, h = 1 }
	local coconut_card = Card(
		game.aij_coconut_holder.T.x + game.aij_coconut_holder.T.w / 2,
		game.aij_coconut_holder.T.y,
		G.CARD_W * SMODS.create_card_scale.w,
		G.CARD_H * SMODS.create_card_scale.h,
		nil,
		G.P_CENTERS["j_aij_coconut"],
		{
			bypass_discovery_center = true,
			bypass_discovery_ui = true,
			discover = false,
			bypass_back = G.GAME.selected_back.pos,
		}
	)

	coconut_card.ability.jest_got_no_ui = true
	G.aij_coconut_holder:emplace(coconut_card)
end

G.FUNCS.aij_coconut_delete = function(e, mute, nosave)
	stop_use()

	local card = e.config.ref_table
	local area = card.area

	card:All_in_Jest_start_dissolve()
	G.E_MANAGER:add_event(Event({
		func = function()
			error("Coconut.joker not found")
			return true
		end,
	}))
end
