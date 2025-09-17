local tamed_lion = {
    object_type = "Consumable",
	key = 'tamed_lion',
	set = 'Tarot',
	pos = { x = 7, y = 5 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 10,
	config = { mod_conv = 'm_aij_canvas', max_highlighted = 1 },
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_aij_canvas
		return {
			vars = {
				card.ability.max_highlighted,
				localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv }
			}
		}
	end,
}
return {name = {"Tarots"}, items = {tamed_lion}}