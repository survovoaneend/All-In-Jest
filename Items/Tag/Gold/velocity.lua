local velocity_tag = {
    object_type = "Tag",
    key = 'velocity',

    pos = { x = 5, y = 2 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'skip',
        },
        extra = {
            money = 100,
            money_mod = 2
        }
    },

    discovered = false,
    order = 22,
    min_ante = 3,

    loc_vars = function(self, info_queue, tag)
        local cur_money = tag.config.extra.money - (tag.config.extra.money_mod * G.GAME.round)
        return {vars = {tag.config.extra.money, tag.config.extra.money_mod, cur_money}}
    end,

    apply = function(self, tag, context)
        if context.type == 'immediate' then
            tag:yep('+', G.C.MONEY,function() 
                return true
            end)
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    ease_dollars(math.max(0,tag.config.extra.money - (tag.config.extra.money_mod * G.GAME.round)), true) 
                    return true
                end
            }))
            tag.triggered = true
            return true
        end
    end,
    in_pool = function(self, args)
        if G.GAME.round <= 19 then
            return true
        end
        return false
    end,
}
return {name = "Tags", items = {velocity_tag}}
