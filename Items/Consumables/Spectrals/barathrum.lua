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
    config = { extra = { }},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {

			}
		}
	end,
    can_use = function(self, card)
        for key, val in pairs(G.P_CENTER_POOLS.Tarot) do
            if not G.GAME.banned_keys[val.key] then
                return true
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
        for key, val in pairs(G.P_CENTER_POOLS.Tarot) do
            if not G.GAME.banned_keys[val.key] then
                return true
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
    G.SETTINGS.paused = false
    if G.OVERLAY_MENU ~= nil then
        G.OVERLAY_MENU:remove()
        G.OVERLAY_MENU = nil
    end
end
return {name = {"Spectrals"}, items = {barathrum}}