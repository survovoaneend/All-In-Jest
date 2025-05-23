local fortunate_tag = {
    object_type = "Tag",
    key = 'fortunate',
    pos = { x = 4, y = 0 },
    atlas = 'tag_atlas',
    discovered = false,
    order = 5, -- This is the 2nd in game but 5th on the list, does not negativiely effct order

    loc_vars = function(self, info_queue)
    end,

    apply = function(self, tag, context)
        if context.type == 'immediate' then
            tag:jest_apply("+", G.C.ATTENTION, function()
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
                return true
			end,
            function() 
                return #G.consumeables.cards < G.consumeables.config.card_limit
            end)
            if tag.HUD_tag.states.visible == false then
                tag.triggered = true
            end
            return true
        end
    end,
}
return {name = "Tags", items = {fortunate_tag}}
