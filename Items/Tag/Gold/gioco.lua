local gioco_tag = {
    object_type = "Tag",
    key = 'gioco',

    pos = { x = 10, y = 1 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'juggle',
        },
    },

    discovered = false,
    order = 19,
    min_ante = 3,

    loc_vars = function(self, info_queue, tag)
        return {vars = {}}
    end,

    apply = function(self, tag, context)
        if context.type == 'round_start_bonus' then 
            tag:yep('+', G.C.BLUE,function() 
                return true
            end)
            G.hand:change_size(G.hand.config.card_limit)
            G.GAME.round_resets.temp_handsize = (G.GAME.round_resets.temp_handsize or 0) + G.hand.config.card_limit
            tag.triggered = true
            return true
        end
    end,
}
return {name = "Tags", items = {gioco_tag}}
