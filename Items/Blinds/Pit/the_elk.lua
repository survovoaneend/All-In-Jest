local the_elk = {
    object_type = "Blind",
    key = 'the_elk',
    boss = {
        min = 1,
    },
    mult = 1,
    boss_colour = HEX("b575e8"),
    atlas = 'blinds',
    pos = { X = 0, y = 54},
    order = 42,
    dollars = 5,

    debuff_hand = function(self, cards, hand, handname, check)
        local bool = false
        for i = 1, #G.GAME.all_in_jest.advanced_hand_usage_ante do
            if handname == G.GAME.all_in_jest.advanced_hand_usage_ante[i].scoring_name then
                bool = true
            end
        end
        return bool
    end

}
return { name = {"Blinds"}, items = {the_elk} }