local the_hook = {
	object_type = "Blind",
	key = "the_hook_GL",
	boss = {
		min = 1,
		all_in_jest = {
			gladiator = true,
		},
	},
	mult = 2,
	attributes = { "discard" },
	boss_colour = HEX("a84024"),
	pos = { x = 0, y = 7 },
	order = 1,
	dollars = 5,

	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.press_play then
			G.E_MANAGER:add_event(Event({
				delay = 0.5,
				trigger = "after",
				func = function()
					local text, disp_text, poker_hands, scoring_hand, non_loc_disp_text =
						G.FUNCS.get_poker_hand_info(G.play.cards)
					if #scoring_hand == 0 then
						return true
					end
					blind:wiggle()
					blind.aij_discarded_card = pseudorandom_element(scoring_hand, pseudoseed("hook"))
					G.play:add_to_highlighted(blind.aij_discarded_card, true)
					play_sound("card1", 1)

					-- and now we re-implement all discard logic yaaay
					inc_career_stat("c_cards_discarded", 1)
					SMODS.calculate_context({ pre_discard = true, full_hand = G.play.highlighted, hook = true })
					blind.aij_discarded_card:calculate_seal({ discard = true, other_card = blind.aij_discarded_card })
					local removed = false
					local effects = {}
					SMODS.calculate_context({
						discard = true,
						other_card = blind.aij_discarded_card,
						full_hand = G.play.highlighted,
						ignore_other_debuff = true,
					}, effects)
					SMODS.trigger_effects(effects)
					for _, eval in pairs(effects) do
						if type(eval) == "table" then
							for key, eval2 in pairs(eval) do
								if key == "remove" or (type(eval2) == "table" and eval2.remove) then
									removed = true
								end
							end
						end
					end
					if removed then
						SMODS.destroy_cards(blind.aij_discarded_card, { immediate = true })
					else
						blind.aij_discarded_card.ability.discarded = true
						blind.aij_discarded_card.ability.aij_discarded_this_ante = true
						local has_line_in_the_sand = next(SMODS.find_card("j_aij_line_in_the_sand"))
						if has_line_in_the_sand then
							draw_card(G.play, G.jest_super_discard, 100, "down", false, blind.aij_discarded_card)
						else
							draw_card(G.play, G.discard, 100, "down", false, blind.aij_discarded_card)
						end
					end
					G.GAME.round_scores.cards_discarded.amt = G.GAME.round_scores.cards_discarded.amt + 1
					check_for_unlock({ type = "discard_custom", cards = { blind.aij_discarded_card } })

					return true
				end,
			}))
			blind.triggered = true
			delay(0.7)
		end
		if context.after then
			blind.aij_discarded_card = nil
		end
	end,
}
return { name = { "Blinds" }, items = { the_hook } }
