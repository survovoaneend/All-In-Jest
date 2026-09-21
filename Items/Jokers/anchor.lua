local anchor = {
	object_type = "Joker",
	order = 62,

	key = "anchor",
	config = {},
	attributes = { "joker", "position" },
	rarity = 2,
	pos = { x = 5, y = 2 },
	atlas = "joker_atlas",
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = false, -- SMODs forces this to be blueprint incompatible
	eternal_compat = true,
	perishable_compat = true,

	loc_vars = function(self, info_queue, card) end,

	calculate = function(self, card, context)
		if
			context.joker_type_destroyed and not context.blueprint
		then
			local card_to_be_destroyed = context.card
			local source_card = context.blueprint_card or card

			-- Do not destroy anchors
			if card_to_be_destroyed == source_card then
				return {
					no_destroy = { override_compat = true },
				}
			else
				-- Check if anchor is to the left or right
				local index_of_destroyed_card = 0
				if G.jokers and G.jokers.cards then
					for i = 1, #G.jokers.cards do
						if G.jokers.cards[i] == card_to_be_destroyed then
							index_of_destroyed_card = i
						end
					end
				end
				local left = index_of_destroyed_card - 1
				local right = index_of_destroyed_card + 1
				local is_nearby = (G.jokers.cards[left] == source_card) or (G.jokers.cards[right] == source_card)
				if is_nearby then
					return {
						no_destroy = { override_compat = true },
					}
				end
			end
		end
	end,
}
return { name = { "Jokers" }, items = { anchor } }
