local lacuna = {
	object_type = "Consumable",
	key = "lacuna",
	set = "Spectral",
	atlas = "consumable_atlas",
	pos = { x = 5, y = 9 },
	cost = 4,
	unlocked = true,
	discovered = false,
	order = 20,
	config = { max_highlighted = 1, extra = { base_value = 5, extra_value = 5 } },
	attributes = { "economy", "destroy_card" },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.max_highlighted,
				card.ability.extra.base_value,
				card.ability.extra.extra_value,
			},
		}
	end,
	use = function(self, card, area, copier)
		delay(0.3)
		for i, sold_card in ipairs(G.hand.highlighted) do
			local sell_value = card.ability.extra.base_value
			if sold_card.config.center ~= G.P_CENTERS.c_base then
				sell_value = sell_value + card.ability.extra.extra_value
			end
			if sold_card.config.aij_other_center then
				sell_value = sell_value + card.ability.extra.extra_value
			end
			if sold_card.edition then
				sell_value = sell_value + card.ability.extra.extra_value
			end
			if sold_card.seal then
				sell_value = sell_value + card.ability.extra.extra_value
			end
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("coin2")
					card:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					sold_card:start_dissolve({ G.C.GOLD })
					inc_career_stat("c_cards_sold", 1)
					return true
				end,
			}))
			ease_dollars(sell_value)
			card_eval_status_text(sold_card, "dollars", sell_value)
			SMODS.calculate_context({ selling_card = true, card = sold_card })
		end

		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.2,
			func = function()
				G.hand:unhighlight_all()
				return true
			end,
		}))
	end,
}
return { name = { "Spectrals" }, items = { lacuna } }
