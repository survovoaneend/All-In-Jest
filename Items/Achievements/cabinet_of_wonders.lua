local cabinet_of_wonders = {
    object_type = "Achievement",
    atlas = "aij_achievement_atlas",
    order = 3,

    key = "cabinet_of_wonders",
    pos = {x=1, y=1},
    hidden_pos = {x=0, y=1},
    reset_on_version_change = true,

    unlock_condition = function(self, args)
        if args.type == 'discover_aij' and G.DISCOVER_TALLIES.aij_consumables then
            if G.DISCOVER_TALLIES.aij_consumables.of == G.DISCOVER_TALLIES.aij_consumables.tally then
                return true
            end
        end
    end,
}
return { name = {"Achievements"}, items = {cabinet_of_wonders} }