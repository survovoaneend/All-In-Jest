local capital_tag = {
    object_type = "Tag",
    key = 'capital',

    pos = { x = 8, y = 1 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'investment',
        },
        extra = {
            dollars = 100
        }
    },

    discovered = false,
    order = 7,
    min_ante = 3,

    loc_vars = function(self, info_queue, tag)
        return {vars = {tag.config.extra.dollars}}
    end,

    apply = function(self, tag, context)
        if context.type == 'eval' then 
            if G.GAME.last_blind and G.GAME.last_blind.boss then
                tag:yep('+', G.C.GOLD,function() 
                    return true
                end)
                tag.triggered = true
                return {
                    dollars = tag.config.extra.dollars,
                    condition = localize('ph_defeat_the_boss'),
                    pos = tag.pos,
                    atlas = 'aij_tag_atlas',
                    tag = tag
                }
            end
        end
    end,
}
return {name = "Tags", items = {capital_tag}}
