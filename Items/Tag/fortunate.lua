local fortunate_tag = {
    object_type = "Tag",
    key = 'fortunate',
    pos = { x = 4, y = 0 },
    atlas = 'tag_atlas',
    discovered = false,
    order = 6,

    loc_vars = function(self, info_queue)
    end,

    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            tag:jest_apply("+", G.C.ATTENTION, function()
                if (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function() 
				                    G.SETTINGS.paused = true
                            G.FUNCS.overlay_menu{
                                config = {no_esc = true},
                                definition = SMODS.jest_no_back_card_collection_UIBox(
                                    G.P_CENTER_POOLS.Tarot, 
                                    {5,6}, 
                                    {
                                        no_materialize = true, 
                                        modify_card = function(card, center) 
                                            if G.GAME.banned_keys[card.config.center.key] then
                                                card.debuff = true
                                            elseif card.config.center.discovered then
                                                jest_create_select_card_ui(card, G.consumeables)
                                            end
                                        end, 
                                        h_mod = 1.05,
                                    }
                                ),
                            }
                            return true 
                        end 
                    }))
                end
                return true
			end,
            function() 
                return (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit
            end)
            if (#G.consumeables.cards + G.GAME.consumeable_buffer) < G.consumeables.config.card_limit then
                tag.triggered = true
                return true
            end
            return
        end
    end,
}
return {name = "Tags", items = {fortunate_tag}}
