local balance_and_blade = {
    object_type = "Consumable",
	key = 'balance_and_blade',
	set = 'Tarot',
	 
	pos = { x = 6, y = 1 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 7,
	config = { max_highlighted = 3 },
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.max_highlighted,
			}
		}
	end,
	use = function(self, card)
		local index = 0
		local cur_suit
		local keys = {}
		for key, val in pairs(SMODS.Suits) do
			local temp_tally = 0
			for k, v in pairs(G.hand.highlighted) do
				if v.base.suit ~= key and not All_in_Jest.has_patches(v, key) then
					temp_tally = temp_tally + 1
				end
			end 
			if temp_tally == #G.hand.highlighted then
				keys[#keys+1] = key
			end
		end
		cur_suit = pseudorandom_element(keys, pseudoseed('balance_and_blade'))
		if #keys <= 0 then
			keys = {}
			for key, val in pairs(SMODS.Suits) do
				for k, v in pairs(G.hand.highlighted) do
					if v.base.suit ~= key and not All_in_Jest.has_patches(v, key) and All_in_Jest.has_suit_in_deck(key, true) then
						keys[#keys+1] = key
					end
				end 
			end
			cur_suit = pseudorandom_element(keys, pseudoseed('balance_and_blade_resample'))
			if #keys <= 0 then
				keys = {}
				for key, val in pairs(SMODS.Suits) do
					if All_in_Jest.has_suit_in_deck(key, true) then
						keys[#keys+1] = key
					end
				end
				cur_suit = pseudorandom_element(keys, pseudoseed('balance_and_blade_resample_2'))
			end
		end
		for k, v in pairs(G.hand.highlighted) do
			if v.base.suit ~= cur_suit and not All_in_Jest.has_patches(v, cur_suit) then
				All_in_Jest.add_patch(v, cur_suit);
			end
        end 
	end,
}
return {name = {"Tarots"}, items = {balance_and_blade}}