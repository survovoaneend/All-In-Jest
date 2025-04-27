local soulbound_tag = {
    object_type = "Tag",
    key = 'soulbound',

    pos = { x = 0, y = 0 },
    atlas = 'tag_atlas',

    discovered = false,
    order = 0,

    loc_vars = function(self, info_queue)
    end,

    -- Function defining the tag's effect
    apply = function(self, tag, context)
        if context.type == 'immediate' then
            tag:yep('+', G.C.RARITY[4], function()
                if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
                    local joker_card = create_card('Joker', G.jokers, true, nil, nil, nil, nil,
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
            end)
            tag.triggered = true
            return true
        end
    end,
    in_pool = function(self)
        return G.GAME.round_resets.ante >= 4
    end,
}
return {name = "Tags", items = {soulbound_tag}}
