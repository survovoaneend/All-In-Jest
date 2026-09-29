local a_v_g_m = {
	object_type = "Joker",
	order = 665,

	key = "a_v_g_m",
	config = {
		extra = {
			cost = 1,
			odds = 3,
		},
	},
	attributes = { "generation", "chance", "joker", "consumable", "playing_card", "tag" },
	rarity = 2,
	pos = { x = 22, y = 29 },
	atlas = "joker_atlas",
	cost = 1,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,

	pixel_size = { w = 65, h = 95 },

	all_in_jest = {
		ability_cost = function(self, card)
			return card.ability.extra.cost
		end,

		can_use_ability = function(self, card, context)
			if (G.GAME.dollars - G.GAME.bankrupt_at) >= card.ability.extra.cost then
				return true
			end
		end,

		use_ability = function(self, card, args)
			args = args or {}
			SMODS.calculate_context({
				all_in_jest = { joker_ability_used = true, card = card, retriggered = args.retriggered, args = args },
			})
			if not args.free then
				ease_dollars(-card.ability.extra.cost)
				-- card_eval_status_text(card, "dollars", -card.ability.extra.cost)
			end
			if pseudorandom("a_v_g_m") < (card.ability.extra.odds / 100) then
				local options = {"tag", "playing_card"}
				if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
					table.insert(options, "joker")
				end
				if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
					table.insert(options, "consumable")
				end

				local chosen_option = pseudorandom_element(options, "a_v_g_m")

				if chosen_option == "joker" then
					G.GAME.joker_buffer = G.GAME.joker_buffer + 1
					G.E_MANAGER:add_event(Event({
						func = function()
							local card = SMODS.add_card({
								set = "Joker",
								area = G.jokers,
								key_append = "a_v_g_m",
							})
							card:start_materialize()
							G.GAME.joker_buffer = 0
							return true
						end,
					}))
				elseif chosen_option == "consumable" then
					create_consumable("Consumeables")
				elseif chosen_option == "playing_card" then
					G.E_MANAGER:add_event(Event({
						func = function()
							local new_card = create_playing_card({
								front = pseudorandom_element(G.P_CARDS, pseudoseed("a_v_g_m")),
								center = G.P_CENTERS.c_base,
							}, card, true, nil, { G.C.SECONDARY_SET.Enhanced }, true)
							new_card:start_materialize()
							G.E_MANAGER:add_event(Event({
								trigger = "after",
								delay = 0.3,
								func = function()
									G.deck:emplace(new_card)
									G.deck.config.card_limit = G.deck.config.card_limit + 1
									return true
								end,
							}))
							playing_card_joker_effects({ new_card })
							return true
						end,
					}))
				elseif chosen_option == "tag" then
					G.E_MANAGER:add_event(Event({
						func = function()
							jest_add_tag(jest_poll_tag("a_v_g_m"))
							return true
						end,
					}))
				end
				card:juice_up(0.4, 0.4)
				play_sound("tarot1")
			else
				card:juice_up(0.4, 0.4)
				attention_text({
                    text = localize('k_nope_ex'),
                    scale = 1, 
                    hold = 0.7,
                    major = card,
                    backdrop_colour = G.C.SECONDARY_SET.Tarot,
                    align = 'bm',
                    offset = {x = 0, y = 0},
				})
			end
		end,
	},

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.odds,
				card.ability.extra.cost,
				colours = {
					G.C.SECONDARY_SET.Enhanced,
				},
			},
		}
	end,

	update = function(self, card, dt)
		if
			not card.aij_ability_cost_label
			or card.config.center.all_in_jest:ability_cost(card) ~= card.aij_ability_cost_label
		then
			card.aij_ability_cost_label = card.config.center.all_in_jest:ability_cost(card) or "??"
		end
	end,

	calculate = function(self, card, context) end,
}
return { name = { "Jokers" }, items = { a_v_g_m } }
