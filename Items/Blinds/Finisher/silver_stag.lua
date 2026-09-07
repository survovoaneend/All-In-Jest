local silver_stag = {
    object_type = "Blind",
    key = 'silver_stag',
    boss = {
      min = 1,
      showdown = true,
    },
    in_pool = function(self)
        return true
    end,
    mult = 2,
    attributes = {'debuff', 'discard'},
    boss_colour = HEX("9cacbe"),
    atlas = 'blinds_final',
    pos = { y = 4},
    order = 1005,
    dollars = 8,

    recalc_debuff = function(self, card, from_blind)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return false
        end
        if card.area ~= G.jokers then
            if card.ability.aij_discarded_this_ante then
                self.triggered = true
                return false
            else
                return true
            end
        end
    end,
}
return { name = {"Finisher Blinds"}, items = {silver_stag} }
