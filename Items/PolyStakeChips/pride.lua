local pride = {
    object_loader = All_in_Jest,
    object_type = "PolyStakeChip",
    order = 11,
    key = "pride",
    pos = { x = 0, y = 1 },
    atlas = "chips_atlas",
    unlocked = false,
    point_requirement = 100,
    stack = 1,
    points = { 30 },
    apply = function(self, stack)
        G.GAME.modifiers.aij_enable_mint_condition = true
    end
}
return { name = { "PolyStakeChips" }, items = { pride } }