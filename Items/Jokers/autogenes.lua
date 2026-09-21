local autogenes = {
	object_type = "Joker",
	order = 765,
	key = "autogenes",
	config = {
		extra = {
			draw_amt = 1,
			choose_amt = 3,
		},
	},
	attributes = { "draw_cards", "choice" },
	rarity = 2,
	pos = { x = 20, y = 46 },
	soul_pos = { x = 21, y = 46 },
	atlas = "joker_atlas",
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.choose_amt,
				card.ability.extra.draw_amt,
			},
		}
	end,

	calculate = function(self, card, context)
		if context.hand_drawn and G.deck and #G.deck.cards > 0 then
			local triggers = math.min(card.ability.extra.draw_amt, #G.deck.cards)
			for i = 1, triggers do
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.5,
					func = function()
						local chosen_cards = {}
						local vaild_cards = {}
						for k, v in ipairs(G.deck.cards) do
							vaild_cards[#vaild_cards + 1] = v
						end
						for i = 1, math.min(card.ability.extra.choose_amt, #G.deck.cards) do
							local choice = pseudorandom_element(vaild_cards, pseudoseed("jest_autogenes"))
							chosen_cards[#chosen_cards + 1] = choice
							for k, v in ipairs(vaild_cards) do
								if v == choice then
									table.remove(vaild_cards, k)
									break
								end
							end
						end
						G.SETTINGS.paused = true
						local width, w_mod, offset = 5, 1, -1.5
						if card.ability.extra.choose_amt >= 6 then
							width, w_mod = 6, 0.8
							if card.ability.extra.choose_amt > 6 then
								offset = -2.25
							end
						end
						G.FUNCS.overlay_menu({
							config = { no_esc = true, offset = {x=1,y=10} },
							definition = SMODS.jest_no_back_card_collection_UIBox(chosen_cards, { width }, {
								no_materialize = true,
								from_area = true,
								hide_single_page = true,
								collapse_single_page = true,
								add_to_area = G.hand,
								add_to_area_args = {
									playing_card = true,
									draw_from_pool = true,
								},
								add_to_area_select_func = "jest_select_haruspex",
								sort = function(table_to_sort)
									pseudoshuffle(table_to_sort, pseudoseed("j_file"))
									table.sort(table_to_sort, function(a, b)
										return a:get_nominal("suit") > b:get_nominal("suit")
									end)
								end,
								w_mod = w_mod,
								h_mod = 1.05,
							}),
						})
						G.OVERLAY_MENU.alignment.offset.y = offset
						G.OVERLAY_MENU:align_to_major()
						return true
					end,
				}))
			end
		end
	end,
}
return { name = { "Jokers" }, items = { autogenes } }
