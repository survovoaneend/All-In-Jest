SMODS.Consumable {
	key = 'nix',
	loc_txt = {
		name = 'Nix',
		text = {
			"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}High Card{}",
                    "{C:mult}+2{} Mult",
			}
	},
	set = 'Planet',
	set_card_type_badge = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_moon'), G.C.SECONDARY_SET.Planet, G.C.WHITE, 1.2 )
	end,
	pos = { x = 2, y = 1 },
	cost = 4,
	unlocked = true,
	discovered = true,
	atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, center)
		return {
			vars = {
				G.GAME.hands['High Card'].level,
				colours = {(G.GAME.hands['High Card'].level==1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands['High Card'].level)])}
			},
		}
    end,
	can_use = function(self, card)
	end,
	use = function(self, card, area, copier)
	end,
}