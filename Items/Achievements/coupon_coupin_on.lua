local coupon_coupin_on = {
    object_type = "Achievement",
    atlas = "aij_achievement_atlas",
    order = 2,

    key = "coupon_coupin_on",
    pos = {x=5, y=0},
    hidden_pos = {x=4, y=0},

    unlock_condition = function(self, args)
        if args.type == 'discover_aij' and G.DISCOVER_TALLIES.aij_vouchers then
            if G.DISCOVER_TALLIES.aij_vouchers.of == G.DISCOVER_TALLIES.aij_vouchers.tally then
                return true
            end
        end
    end,
}
return { name = {"Achievements"}, items = {coupon_coupin_on} }