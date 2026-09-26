local broken_foot = {
    object_loader = All_in_Jest,
    object_type = "PolyStakeChip",
    order = 8,
    key = "broken_foot",
    pos = { x = 7, y = 0 },
    atlas = "chips_atlas",
    stack = 2,
    points = { 100, 200 },
    apply = function(self, stack)
        G.GAME.starting_params.discards = G.GAME.starting_params.discards - stack
        G.GAME.round_resets.discards = G.GAME.starting_params.discards
        G.GAME.current_round.discards_left = G.GAME.starting_params.discards
    end
}
return { name = { "PolyStakeChips" }, items = { broken_foot } }