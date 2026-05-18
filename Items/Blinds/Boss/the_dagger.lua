local the_dagger = {
    object_type = "Blind",
    key = 'the_dagger',
    
    boss = {
        min = 1,
    },
    mult = 2,
    boss_colour = HEX("692a2a"),
    atlas = 'blinds',
    pos = { X = 0, y = 90},
    order = 90,
    dollars = 5,

    debuff_hand = function(self, cards, hand, handname, check)
        local value = 0
        if cards then
            for k, v in ipairs(cards) do
                if v:is_suit("Spades") or v:is_suit("Clubs")then
                    value = value + 1
                end
            end
        end
        if value and value > 0 then
            return false
        else
            G.GAME.blind.triggered = true
            return true
        end
    end
}
return { name = {"Blinds"}, items = {the_dagger} }