local dark_star = {
    object_type = "Consumable",
	key = 'dark_star',
	set = 'Planet',
	pos = { x = 7, y = 1 },
	set_card_type_badge = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_star_q'), G.C.SECONDARY_SET.Planet, G.C.WHITE, 1.2 )
	end,
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 34,
	config = { },
	atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				
			},
		}
    end,
	can_use = function(self, card)
		for _, k in ipairs(G.handlist) do
		    local hand = G.GAME.hands[k]
		    if SMODS.is_poker_hand_visible(k) and hand.played > 0 then
				return true
		    end
		end
		return false
	end,
	use = function(self, card, area, copier)
		for _, k in ipairs(G.handlist) do
		    local hand = G.GAME.hands[k]
		    if hand.played == 0 then
				if SMODS.is_poker_hand_visible(k) then
					update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(k, 'poker_hands'),chips = hand.chips, mult = hand.mult, level=hand.level})
					level_up_hand(card, k)
					update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
				else
					level_up_hand(card, k, true)
				end
		    end
		end
	end,
	in_pool = function(self, args)
		for _, k in ipairs(G.handlist) do
		    local hand = G.GAME.hands[k]
		    if SMODS.is_poker_hand_visible(k) and hand.played > 0 and G.GAME.round_resets.ante >= 4 then
				return true
		    end
		end
		return false
    end,
	aij_weight = function(self)
        return -3
    end,
}
return {name = {"Planets"}, items = {dark_star}}