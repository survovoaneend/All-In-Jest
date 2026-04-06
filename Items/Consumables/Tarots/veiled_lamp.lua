local veiled_lamp = {
    object_type = "Consumable",
	key = 'veiled_lamp',
	set = 'Tarot',
	 lite = true,
	pos = { x = 7, y = 3 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 8,
	config = { mod_conv = 'm_aij_ice', max_highlighted = 1 },
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_aij_ice
		return {
			vars = {
				card.ability.max_highlighted,
				localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv }
			}
		}
	end,
}
return {name = {"Tarots"}, items = {veiled_lamp}}