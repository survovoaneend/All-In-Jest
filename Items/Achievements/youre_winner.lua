local youre_winner = {
    object_type = "Achievement",
    atlas = "aij_achievement_atlas",
    order = 1000,

    key = "youre_winner",
    pos = {x=3, y=1},
    hidden_pos = {x=2, y=1},

    unlock_condition = function(self, args)
        if args.type and G.PROGRESS.aij_achievements then
            if G.PROGRESS.aij_achievements.of == G.PROGRESS.aij_achievements.tally then
                return true
            end
        end
    end,
}
return { name = {"Achievements"}, items = {youre_winner} }