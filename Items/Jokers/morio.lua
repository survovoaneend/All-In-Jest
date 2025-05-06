local morio = {
    object_type = "Joker",
    order = 231,
    ignore = true,
    key = "morio",
    config = {
      
    },
    rarity = 3,
    pos = { x = 20, y = 8},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.end_of_round and G.GAME.blind.boss then
            if #G.consumeables.cards < G.consumeables.config.card_limit then
		        G.SETTINGS.paused = true
                G.FUNCS.overlay_menu{
                    config = {no_esc = true},
                    definition = SMODS.jest_no_back_card_collection_UIBox(
                        G.P_CENTER_POOLS.Tarot, 
                        {5,6}, 
                        {
                            no_materialize = true, 
                            modify_card = function(card, center) 
                                if card.config.center.discovered then
                                jest_create_select_card_ui(card, G.consumeables)
                                end
                            end, 
                            h_mod = 1.05,
                        }
                    ),
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {morio} }
