local golem = {
	object_type = "Consumable",
	key = "golem",
	set = "Tarot",
	pos = { x = 15, y = 4 },
	set_card_type_badge = function(self, card, badges)
		badges[#badges + 1] = create_badge(localize("k_tarot_q"), G.C.SECONDARY_SET.Tarot, G.C.WHITE, 1.2)
	end,
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 24,
	config = { max_highlight = 2 },
	atlas = "consumable_atlas",
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.max_highlight,
			},
		}
	end,
	can_use = function(self, card, area, copier)
		if
			card.ability.max_highlight >= #G.hand.highlighted
			and #G.hand.highlighted >= 1
		then
			for k, v in ipairs(G.hand.highlighted) do
				if not SMODS.has_enhancement(v, "m_stone") then
					return false
				end
			end
			return true
		end
	end,
	use = function(self, card)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("tarot1")
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))

		for i = 1, #G.hand.highlighted do
			local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					G.hand.highlighted[i]:flip()
					play_sound("card1", percent)
					G.hand.highlighted[i]:juice_up(0.3, 0.3)
					return true
				end,
			}))
		end

		delay(0.2)

		local cen_pool = {}
		for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
			if v.key ~= "m_stone" then
				cen_pool[#cen_pool + 1] = v.key
			end
		end
		for i = 1, #G.hand.highlighted do
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					center = pseudorandom_element(cen_pool, pseudoseed("golem"))
					All_in_Jest.set_other_enhancement(G.hand.highlighted[i], center)
					return true
				end,
			}))
		end

		for i = 1, #G.hand.highlighted do
			local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.15,
				func = function()
					G.hand.highlighted[i]:flip()
					play_sound("tarot2", percent, 0.6)
					G.hand.highlighted[i]:juice_up(0.3, 0.3)
					return true
				end,
			}))
		end

		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.2,
			func = function()
				G.hand:unhighlight_all()
				return true
			end,
		}))

		delay(0.5)
	end,
	in_pool = function(self, args)
		return false
	end,
}
return { name = { "Tarots" }, items = { golem } }
