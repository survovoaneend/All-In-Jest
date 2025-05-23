local soulbound_tag = {
    object_type = "Tag",
    key = 'soulbound',

    pos = { x = 0, y = 0 },
    atlas = 'tag_atlas',

    discovered = false,
    order = 0,
    min_ante = 4,

    loc_vars = function(self, info_queue)
    end,

    -- Function defining the tag's effect
    apply = function(self, tag, context)
        if context.type == 'immediate' then
            tag:jest_apply('+', G.C.RARITY[4], function()
                if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
                    local joker_card = create_card('Joker', G.jokers, true, nil, nil, true, nil,
                        'perishable_legendary_tag')

                    if joker_card then
                        joker_card.ability.perishable = true
                        joker_card.ability.perish_tally = G.GAME.perishable_rounds or 5

                        joker_card:add_to_deck()
                        G.jokers:emplace(joker_card)
                        joker_card:start_materialize()
                    end
                end
                return true
            end,
            function() 
                return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
            end)
            if tag.HUD_tag.states.visible == false then
                tag.triggered = true
            end
            return true
        end
    end,
}
return {name = "Tags", items = {soulbound_tag}}
