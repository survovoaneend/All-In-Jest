local hermetic_tag = {
    object_type = "Tag",
    key = 'hermetic',
    pos = { x = 10, y = 2 },
    atlas = 'tag_atlas',
    discovered = false,
    order = 16,
    min_ante = 3,
    config = {
        aij = {
            upgrade = 'etheral',
        }
    },

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
                            G.P_CENTER_POOLS.Spectral, 
                            {4,5}, 
                            {
                                no_materialize = true, 
                                modify_card = function(card, center) 
                                    if card.config.center.discovered and (not card.config.center.hidden) then
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
return {name = "Tags", items = {hermetic_tag}}
