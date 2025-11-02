local bierstiefel_tag = {
    object_type = "Tag",
    key = 'bierstiefel',

    pos = { x = 8, y = 2 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'top_up',
        },
    },

    discovered = false,
    order = 21,
    min_ante = 3,

    loc_vars = function(self, info_queue, tag)
    end,

    apply = function(self, tag, context)
        if context.type == 'immediate' then
            tag:jest_apply("+", G.C.ATTENTION, function()
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    local jokers_to_create = G.jokers.config.card_limit - #G.jokers.cards
                    G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            for i = 1, jokers_to_create do
                                local card = create_card('Joker', G.jokers, nil, pseudorandom('jest_bierstiefel_tag') * 0.95, nil, nil, nil, 'jest_bierstiefel_tag')
                                card:add_to_deck()
                                G.jokers:emplace(card)
                                card:start_materialize()
                                G.GAME.joker_buffer = 0
                            end
                            return true
                        end
                    }))   
                end
                return true
			end,
            function() 
                return #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
            end)
            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                tag.triggered = true
                return true
            end
            return
        end
    end,
}
return {name = "Tags", items = {bierstiefel_tag}}
