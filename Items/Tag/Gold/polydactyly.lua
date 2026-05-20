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
        return {vars = {math.min(G.GAME.all_in_jest.unused_hands.run, 40)}}
    end,

    apply = function(self, tag, context)
        if context.type == 'round_start_bonus' then
            tag:jest_apply('+', G.C.BLUE,function() 
                ease_hands_played(math.min(G.GAME.all_in_jest.unused_hands.run, 40))
                return true
			end,
            function() 
                return true
            end)
            tag.triggered = true
            return true
        end
    end,
}
return {name = "Tags", items = {polydactyly_tag}}