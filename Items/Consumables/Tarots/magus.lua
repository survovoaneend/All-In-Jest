local magus_tarot = {
    object_type = "Consumable",
	key = 'magus',
	set = 'Tarot',
	pos = { x = 0, y = 4 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 0,
	config = { mod_conv = 'm_aij_fervent', max_highlighted = 1 },
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_aij_fervent
		return {
			vars = {
				card.ability.max_highlighted,
				localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv }
			}
		}
	end,
}
return {name = {"Tarots"}, items = {magus_tarot}}