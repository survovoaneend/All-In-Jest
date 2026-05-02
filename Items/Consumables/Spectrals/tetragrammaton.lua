G.FUNCS.c_aij_tetragrammaton_set_submit = function(args)
	G.E_MANAGER:add_event(Event({
		func = function()
			local new_cards = {}
            local new_card = copy_card(G.customize_card.cards[1], nil, nil, G.playing_card)
            new_card:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, new_card)
            G.deck:emplace(new_card)
			playing_card_joker_effects({new_card})
			if G.customize_card ~= nil then
				G.customize_card:remove()
				G.customize_card = nil
			end
			if G.OVERLAY_MENU ~= nil then
				G.OVERLAY_MENU:remove()
				G.OVERLAY_MENU = nil
			end
			return true
		end,
	}))
end

local tetragrammaton = {
	object_type = "Consumable",
	key = "tetragrammaton",
	set = "Spectral",
	pos = { x = 6, y = 4 },
	cost = 4,
	unlocked = true,
	discovered = false,
	order = 1,
	config = { extra_cards = 4 },
	atlas = "consumable_atlas",
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra_cards } }
	end,
	can_use = function(self, card)
		if G.deck then
			return true
		end
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({
			func = function()
				-- G.SETTINGS.paused = true
				G.FUNCS.overlay_menu({
					config = { no_esc = true },
					definition = create_UIBox_nonstandard("c_aij_tetragrammaton_set_submit"),
				})
				return true
			end,
		}))

        G.E_MANAGER:add_event(Event({
            func = function()
                for i = 1, card.ability.extra_cards do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local _card = create_playing_card({
                                front = pseudorandom_element(G.P_CARDS, pseudoseed("tetragrammaton")),
                                center = G.P_CENTERS.c_base,
                            }, G.deck, nil, nil, { G.C.SECONDARY_SET.Enhanced })
                            G.GAME.blind:debuff_card(_card)
                            playing_card_joker_effects({ _card })
                            _card:juice_up(0.3, 0.5)
                            return true
                        end,
                    }))
                end
                return true
            end,
        }))
	end,
}
return { name = { "Spectrals" }, items = { tetragrammaton } }
