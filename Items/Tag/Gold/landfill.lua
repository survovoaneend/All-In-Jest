local landfill_tag = {
    object_type = "Tag",
    key = 'landfill',

    pos = { x = 8, y = 0 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'garbage',
        },
    },

    discovered = false,
    order = 15,
    min_ante = 3,

    loc_vars = function(self, info_queue, tag)
        return {vars = {G.GAME.round_scores.cards_discarded.amt}}
    end,

    apply = function(self, tag, context)
        if context.type == 'immediate' then
            tag:yep('+', G.C.MONEY,function() 
                return true
            end)
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    ease_dollars(G.GAME.round_scores_cards.discarded.amt) 
                    return true
                end
            }))
            tag.triggered = true
            return true
        end
    end,
}
return {name = "Tags", items = {landfill_tag}}