local karat = {
    object_type = "Achievement",
    atlas = "aij_achievement_atlas",
    order = 1,

    key = "karat",
    pos = {x=3, y=0},
    hidden_pos = {x=2, y=0},

    unlock_condition = function(self, args)
        if args.type == 'discover_aij' and G.DISCOVER_TALLIES.gold_tags then
            if G.DISCOVER_TALLIES.gold_tags.of == G.DISCOVER_TALLIES.gold_tags.tally then
                return true
            end
        end
    end,
}
return { name = {"Achievements"}, items = {karat} }