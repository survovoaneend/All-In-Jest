local the_pit = {
    object_type = "Challenge",
    key = 'the_pit',
    ignore = true,
    unlocked = function(self) -- Unlocks if player has discovered at least one pit blind
        if G and G.P_BLINDS then
            local discovered_amt = 0
            for k, v in pairs(G.P_BLINDS) do
                if v and v.boss and v.boss.all_in_jest and v.boss.all_in_jest.pit and v.discovered then
                    discovered_amt = discovered_amt + 1
                end
            end
            return discovered_amt > 0
        end
    end,
    jokers = { },
    rules = {
        custom = {
            {id = 'aij_all_pit_blinds'},
        },
    },
    restrictions = { },
}

return { name = {"Challenges"}, items = {the_pit} }