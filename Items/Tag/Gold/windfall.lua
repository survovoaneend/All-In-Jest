local windfall_tag = {
    object_type = "Tag",
    key = 'windfall',

    pos = { x = 6, y = 0 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'economy',
        }
    },

    discovered = false,
    order = 24,
    min_ante = 3,

    loc_vars = function(self, info_queue)
    end,

    apply = function(self, tag, context)
        if context.type == 'immediate' then
            tag:yep('+', G.C.MONEY,function() 
                return true
            end)
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    ease_dollars(math.max(0,math.min(to_big(G.GAME.dollars), 300) * 2), true) -- Triples Money (Money + 2 Money)
                    return true
                end
            }))
            tag.triggered = true
            return true
        end
    end,
}
return {name = "Tags", items = {windfall_tag}}
