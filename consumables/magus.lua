SMODS.Consumable {
	key = 'magus',
	loc_txt = {
		name = 'The Magus',
		text = {
			"Enhances {C:attention}1{} selected",
            "card into a",
            "{C:attention}Fervent Card{}"

			}
	},
	set = 'Tarot',
	pos = { x = 0, y = 4 },
	cost = 3,
	unlocked = true,
	discovered = true,
	config = {mod_conv = 'm_aij_fervent', max_highlighted = 1},
	atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_aij_fervent
	end,
}