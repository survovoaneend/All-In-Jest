local overstuffed = {
    object_type = "Tag",
    key = 'overstuffed',
    pos = { x = 3, y = 0 },
    atlas = 'tag_atlas',

    discovered = false,
    order = 3,
    config = {},

    loc_vars = function(self, info_queue)
    end,

    apply = function(self, tag, context)
        if context.type == 'shop_start' then
            tag:jest_apply("+", G.C.ATTENTION, function()
                G.GAME.jest_change_booster_options.op.mult = 2
                G.GAME.jest_change_booster_options.trigger = true
                G.GAME.jest_change_booster_options.option = "both"
                return true
			end,
            function() 
                return G.GAME.jest_change_booster_options.op.mult ~= 2
            end)
            tag.triggered = true
            return true
        end
    end,
}
return {name = "Tags", items = {overstuffed}}
