local polydactyly_tag = {
    object_type = "Tag",
    key = 'polydactyly',

    pos = { x = 7, y = 3 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'handy',
        },
    },

    discovered = false,
    order = 14,
    min_ante = 3,

    loc_vars = function(self, info_queue, tag)
        return {vars = {G.GAME.jest_unused_hands}}
    end,

    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            tag:jest_apply('+', G.C.BLUE,function() 
                G.GAME.round_bonus.next_hands = G.GAME.jest_unused_hands
                return true
			end,
            function() 
                return true
            end)
            if tag.HUD_tag.states.visible == false then
                tag.triggered = true
            end
            return true
        end
    end,
}
return {name = "Tags", items = {polydactyly_tag}}