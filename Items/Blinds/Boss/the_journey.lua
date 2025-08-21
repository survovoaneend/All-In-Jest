local the_journey = {
    object_type = "Blind",
    key = 'the_journey',
    boss = {
        min = 3,
        trigger = false
    },
    mult = 2,
    boss_colour = HEX("fdd879"),
    atlas = 'blinds',
    pos = { X = 0, y = 56},
    order = 28,
    dollars = 5,


    calculate = function(self, card, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.end_of_round and not self.boss.trigger and not temp then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.win_ante = G.GAME.win_ante + 1
                    return true
                end
            }))
            self.boss.trigger = true
        end
    end,
    in_pool = function(self)
        if G.GAME.round_resets.ante < 7 and not G.GAME.won then
            return true
        end
    end,
}
return { name = {"Blinds"}, items = {the_journey} }