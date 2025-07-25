local ventripotent_tag = {
    object_type = "Tag",
    key = 'ventripotent',

    pos = { x = 11, y = 0 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'aij_overstuffed',
        }
    },

    discovered = false,
    order = 30,
    min_ante = 3,

    loc_vars = function(self, info_queue)
    end,

    apply = function(self, tag, context)
        if context.type == 'open_booster' then
            tag:jest_apply("+", G.C.ATTENTION, function()
                G.GAME.jest_change_booster_options.pack_choices = "unlimited"
                G.GAME.jest_change_booster_options.op.mult = 2
                G.GAME.jest_change_booster_options.trigger = true
                G.GAME.jest_change_booster_options.option = "size"
                return true
			end,
            function() 
                return G.GAME.jest_change_booster_options.op.mult ~= 2
            end)
            if tag.HUD_tag.states.visible == false then
                tag.triggered = true
            end
            return true
        end
    end,
}
return {name = "Tags", items = {ventripotent_tag}}
