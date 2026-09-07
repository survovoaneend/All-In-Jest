local barathrum = {
    object_type = "Consumable",
	key = 'barathrum',
	set = 'Spectral',
    atlas = 'consumable_atlas',
	pos = { x = 9, y = 8 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 13,
    config = { extra = { select = 2 }},
    attributes = {'tarot', 'choice'},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
                card.ability.extra.select
			}
		}
	end,
    can_use = function(self, card)
        local available = 0
        for key, val in pairs(G.P_CENTER_POOLS.Tarot) do
            if not G.GAME.banned_keys[val.key] then
                available = available + 1
                if available >= card.ability.extra.select then
                    return true
                end
            end
        end
        return false
    end,
	use = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function() 
                local available_cards = {}
                for key, val in pairs(G.P_CENTER_POOLS.Tarot) do
                    if not G.GAME.banned_keys[val.key] then
                        available_cards[#available_cards+1] = val
                    end
                end
                G.SETTINGS.paused = true
                G.GAME.aij_barathrum_choices_remaining = card.ability.extra.select
                G.FUNCS.overlay_menu{
                    config = {},
                    definition = SMODS.jest_no_back_card_collection_UIBox(
                        available_cards, 
                        {5,6}, 
                        {
                            hide_single_page = true,
                            collapse_single_page = true, 
                            modify_card = function(cardd, center) 
                                if cardd.config.center.discovered then
                                    jest_create_select_card_ui(cardd, nil, {
                                        alt_text = localize('k_aij_remove'),
                                        alt_colour = HEX("dd463c"),
                                    }, 'jest_barathrum_remove')
                                end
                            end, 
                            h_mod = 1.05,
                        }
                    ),
                }
                return true 
            end 
        }))
    end,
    in_pool = function(self, args)
        local available = 0
        for key, val in pairs(G.P_CENTER_POOLS.Tarot) do
            if not G.GAME.banned_keys[val.key] then
                available = available + 1
                if available >= self.config.extra.select then
                    return true
                end
            end
        end
        return false
    end,
}
G.FUNCS.jest_barathrum_remove = function(e)
    local card = e.config.ref_table
    local area = e.config.data[1]
    local data = e.config.data[2]
    G.GAME.banned_keys[card.config.center.key] = true
    card:start_dissolve({G.C.RED}, nil, 0.5)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            G.GAME.aij_barathrum_choices_remaining = G.GAME.aij_barathrum_choices_remaining - 1
            if G.GAME.aij_barathrum_choices_remaining > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        local available_cards = {}
                        for key, val in pairs(G.P_CENTER_POOLS.Tarot) do
                            if not G.GAME.banned_keys[val.key] then
                                available_cards[#available_cards+1] = val
                            end
                        end
                        G.SETTINGS.paused = true
                        G.FUNCS.overlay_menu{
                            config = {offset = {x=0, y=0}},
                            definition = SMODS.jest_no_back_card_collection_UIBox(
                                available_cards, 
                                {5,6}, 
                                {
                                    hide_single_page = true,
                                    collapse_single_page = true, 
                                    offset = {x=0,y=-G.ROOM.T.h/2},
                                    no_materialize = true,
                                    juice_card = {0.2, 0.1},
                                    modify_card = function(cardd, center) 
                                        if cardd.config.center.discovered then
                                            jest_create_select_card_ui(cardd, nil, {
                                                alt_text = localize('k_aij_remove'),
                                                alt_colour = HEX("dd463c"),
                                                bond = 'Strong',
                                            }, 'jest_barathrum_remove')
                                        end
                                    end, 
                                    h_mod = 1.05,
                                }
                            ),
                        }
                        return true 
                    end 
                }))
            else
                if G.OVERLAY_MENU ~= nil then
                    G.OVERLAY_MENU:remove()
                end
                G.SETTINGS.paused = false
                G.OVERLAY_MENU = nil
            end
            return true 
        end 
    }))
end
return {name = {"Spectrals"}, items = {barathrum}}