local cubic_stone_tarot = {
    object_type = "Consumable",
	key = 'cubic_stone',
	set = 'Tarot',
	 ignore = true,
	pos = { x = 3, y = 6 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 3,
	config = { mod_conv = 'm_aij_dyscalcular', max_highlighted = 1 },
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_aij_dyscalcular
		return {
			vars = {
				card.ability.max_highlighted,
				localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv }
			}
		}
	end,
}
return {name = {"Tarots"}, items = {cubic_stone_tarot}}