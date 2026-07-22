local all_in = {
    object_type = "Achievement",
    atlas = "aij_achievement_atlas",
    order = 4,

    key = "all_in",
    pos = {x=5, y=1},
    hidden_pos = {x=4, y=1},
    reset_on_version_change = true,

    unlock_condition = function(self, args)
        if args.type == 'win_stake' and G.PROGRESS.aij_joker_gold_stickers then
            if G.PROGRESS.aij_joker_gold_stickers.of == G.PROGRESS.aij_joker_gold_stickers.tally then
                return true
            end
        end
    end,
}
return { name = {"Achievements"}, items = {all_in} }