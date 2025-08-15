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
		local keys = {}
		for k, v in pairs(SMODS.Suits) do
			keys[#keys+1] = k
		end
		local cur_suit = pseudorandom_element(keys, pseudoseed('balance_and_blade'))
		for i=1, #G.hand.highlighted do
			All_in_Jest.add_patch(G.hand.highlighted[i], cur_suit);
        end 
	end,
}
return {name = {"Tarots"}, items = {balance_and_blade}}