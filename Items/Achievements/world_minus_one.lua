local world_minus_one = {
    object_type = "Achievement",
    atlas = "aij_achievement_atlas",
    order = 0,

    key = "world_minus_one",
    pos = {x=1, y=0},
    hidden_pos = {x=0, y=0},

    unlock_condition = function(self, args)
        if args.type == 'ante_change' and (args.ante+args.ante_change) == -1 then
            return true
        end
    end,
}
return { name = {"Achievements"}, items = {world_minus_one} }