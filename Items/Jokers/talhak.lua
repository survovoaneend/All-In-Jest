local talhak = {
    object_type = "Joker",
    order = 1059,
    
    key = "talhak",
    config = {

    },
    rarity = 4,
    pos = { x = 8, y = 10},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 8, y = 11},
  
    loc_vars = function(self, info_queue, card)

    end,

    calculate = function(self, card, context)
        if context.end_of_round and G.GAME.blind.boss then
            if #G.consumeables.cards < G.consumeables.config.card_limit then
		        G.SETTINGS.paused = true
                G.FUNCS.overlay_menu{
                    config = {no_esc = true},
                    definition = SMODS.jest_no_back_card_collection_UIBox(
                        G.P_CENTER_POOLS.Spectral, 
                        {4,5}, 
                        {
                            no_materialize = true, 
                            modify_card = function(card, center) 
                                if card.config.center.discovered and (card.config.center_key ~= "c_soul") then
                                jest_create_select_card_ui(card, G.consumeables)
                                end
                            end, 
                            h_mod = 1.05,
                        }
                    ),
                }
            end
        end
    end,
}
return { name = {"Jokers"}, items = {talhak} }