
local joker_listing = {
	{"j_aij_nevernamed_credits_joker", 
  "j_aij_survivalaren_credits_joker", 
  "j_aij_rattling_snow_credits_joker", 
  "j_aij_jumbocarrot_credits_joker",
  "j_aij_heavenbrand_credits_joker", 
  "j_aij_jamie_credits_joker", 
  "j_aij_vitellary_credits_joker"},
}
-- Modify main page
All_in_Jest.custom_ui = function(mod_nodes)
	local set = joker_listing[1]
	G.aij_main_jokers_list = CardArea(
		G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
		5.25 * G.CARD_W,
		0.95 * G.CARD_H,
		{ card_limit = #set, type = 'title', highlight_limit = 0, collection = true }
	)
	local silent = false
	for i, center in pairs(set) do
		G.GAME.viewed_back = Back(G.P_CENTERS.b_aij_fabled)
		local card = Card(G.aij_main_jokers_list.T.x + (G.aij_main_jokers_list.T.w / 2), G.aij_main_jokers_list.T.y,
			G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS[center] or All_in_Jest.DescriptionDummies[center],
			{
				bypass_discovery_center = true,
				bypass_discovery_ui = true,
				bypass_lock = true,
				playing_card = i,
				viewing_back = false,
				bypass_back =
					G.P_CENTERS["b_aij_fabled"].pos
			})
		G.aij_main_jokers_list:emplace(card)
		card:hard_set_T(G.aij_main_jokers_list.T.x + (G.aij_main_jokers_list.T.w / 2))
		card.sprite_facing = 'front'
		card.facing = 'front'
		card:start_materialize({ G.C.RED }, silent)
		silent = true
	end
	mod_nodes[#mod_nodes + 1] = {
		n = G.UIT.R,
		config = { minh = 0.2, padding = 0.2 }
	}
	mod_nodes[#mod_nodes + 1] = {
		n = G.UIT.R,
    config = { align = "cm" },
		nodes = {
			{
				n = G.UIT.C,
				config = { align = "cm", padding = 0.5, colour = darken(G.C.BLACK, 0.2), emboss = 0.05, r = 0.1 },
				nodes = {
					{
						n = G.UIT.R,
						config = { align = "cm", no_fill = true },
						nodes = {
							{ n = G.UIT.O, config = { object = G.aij_main_jokers_list } },
						}
					},
				}
			},
		}
	}
	return mod_nodes
end