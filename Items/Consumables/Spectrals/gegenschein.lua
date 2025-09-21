local gegenschein = {
    object_type = "Consumable",
	key = 'gegenschein',
	set = 'Spectral',
	pos = { x = 7, y = 2 },
	cost = 4,
    hidden = true,
    soul_rate = 0.003,
    soul_set = 'Planet',
	unlocked = true,
	discovered = false,
    order = 40,
	config = {},
	atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
	end,
    can_use = function(self, card)
        for hand_key, hand_data in pairs(G.GAME.hands) do
            for _, v in pairs(G.GAME.all_in_jest.secret_hands) do 
                if hand_key == v and G.GAME.hands[hand_key].played > 1 then
                    return true
                end
            end
        end
        return false
    end,
	use = function(self, card, area, copier)
        for hand_key, hand_data in pairs(G.GAME.hands) do
            for _, v in pairs(G.GAME.all_in_jest.secret_hands) do 
                if hand_key == v and G.GAME.hands[hand_key].played > 1 then
                    update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(hand_key, 'poker_hands'),chips = G.GAME.hands[hand_key].chips, mult = G.GAME.hands[hand_key].mult, level=G.GAME.hands[hand_key].level})
			        level_up_hand(card, hand_key, nil, G.GAME.hands[hand_key].played-G.GAME.hands[hand_key].level)
			        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
                end
            end
        end
    end,
    in_pool = function(self, args)
        for hand_key, hand_data in pairs(G.GAME.hands) do
            for _, v in pairs(G.GAME.all_in_jest.secret_hands) do 
                if hand_key == v and G.GAME.hands[hand_key].played > 1 then
                    return true
                end
            end
        end
        return false
    end,
}
return {name = {"Spectrals", "Planets"}, items = {gegenschein}}