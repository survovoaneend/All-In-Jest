local typhon_tarot = {
    object_type = "Consumable",
	key = 'typhon',
	set = 'Tarot',
	pos = { x = 7, y = 8 },
	cost = 3,
	unlocked = true,
	discovered = false,
	ignore = true,
	order = 14,
	config = { mod_conv = 'm_aij_scorched', max_highlighted = 2 },
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_aij_scorched
		return {
			vars = {
				card.ability.max_highlighted,
				localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv }
			}
		}
	end,
}
return {name = {"Tarots"}, items = {typhon_tarot}}