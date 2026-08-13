local galloping_domino_tag = {
    object_type = "Tag",
    key = 'galloping_domino',

    pos = { x = 6, y = 1 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'd_six',
        },
        extra = {
            rerolls = 10,
        }
    },

    discovered = false,
    order = 20,
    min_ante = 3,

    loc_vars = function(self, info_queue, tag)
        return {vars = {tag.config.extra and tag.config.extra.rerolls or self.config.extra.rerolls}}
    end,

    apply = function(self, tag, context)
        if context.type == 'shop_start' then
            if not G.GAME.shop_galloping_dominoed then
                G.GAME.shop_galloping_dominoed_amt = tag.config.extra and tag.config.extra.rerolls or self.config.extra.rerolls
                tag:yep('+', G.C.GREEN,function() 
                    G.GAME.round_resets.temp_reroll_cost = 0
                    calculate_reroll_cost(true)
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end,
}
return {name = "Tags", items = {galloping_domino_tag}}
