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
    -- At first, only allow a patch if at all three cards can have it applied with meaningful impact
    -- (e.g. a heart card with a heart suit doesn't do jack, so if there's a heart card then don't create a heart patch)
		for key, val in pairs(All_in_Jest.get_suits(nil, true)) do
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

    -- If there were no valid patches, then make a new set of valid patches with looser rules
		if #keys <= 0 then
      -- Try again, allowing any patch that can meaningfully affect at least one card
			keys = {}
			for key, val in pairs(All_in_Jest.get_suits(nil, true)) do
				for k, v in pairs(G.hand.highlighted) do
					if v.base.suit ~= key and not All_in_Jest.has_patches(v, key) and All_in_Jest.has_suit_in_deck(key, true) then
						keys[#keys+1] = key
					end
				end 
			end

      -- This time allow any patch that matches a suit in the deck
			cur_suit = pseudorandom_element(keys, pseudoseed('balance_and_blade_resample'))
			if #keys <= 0 then
				keys = {}
				for key, val in pairs(All_in_Jest.get_suits(nil, true)) do
					if All_in_Jest.has_suit_in_deck(key, true) then
						keys[#keys+1] = key
					end
				end
				cur_suit = pseudorandom_element(keys, pseudoseed('balance_and_blade_resample_2'))

        -- If somehow every card in the deck has no suit then just go with the SMODS suits pool
        if #keys <= 0 then
          cur_suit = pseudorandom_element(SMODS.Suits, pseudoseed('balance_and_blade_resample_how_in_the_everliving_localthunk_did_you_get_to_this_point'))
          cur_suit = cur_suit.key
        end
			end
		end
  
		for k, v in pairs(G.hand.highlighted) do
			if (v.base.suit ~= cur_suit or SMODS.has_no_suit(v)) and not All_in_Jest.has_patches(v, cur_suit) then
				All_in_Jest.add_patch(v, cur_suit);
			end
    end 

		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4,func = function() G.hand:unhighlight_all(); return true end }))
	end,
}
return {name = {"Tarots"}, items = {balance_and_blade}}