local isis_urania = {
    object_type = "Consumable",
	key = 'isis_urania',
	set = 'Tarot',
	 ignore = true,
	pos = { x = 2, y = 6 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 2,
	config = { mod_conv = 'm_aij_charged', max_highlighted = 1 },
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_aij_charged
		return {
			vars = {
				card.ability.max_highlighted,
				localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv }
			}
		}
	end,
}
return {name = {"Tarots"}, items = {isis_urania}}