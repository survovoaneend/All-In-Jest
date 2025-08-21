local the_auroch = {
    object_type = "Blind",
    key = 'the_auroch',
    boss = {
        min = 3,
        suit = nil,
        rank = nil
    },
    mult = 2,
    boss_colour = HEX("7a7f89"),
    atlas = 'blinds',
    pos = { X = 0, y = 51},
    order = 27,
    dollars = 5,

    loc_vars = function(self)
        return {
            vars = {self.boss.suit, self.boss.rank}
        }
    end,

    collection_loc_vars = function(self)
        return {
            vars = {'(Most common suit)', '(Most common rank)'}
        }
    end,

    stay_flipped = function(self, area, card)
        if self.boss.suit and self.boss.rank and area == G.hand then
            if card.base.suit == self.boss.suit or card.base.value == self.boss.rank then
                return true
            end
        end
    end,

}
return { name = {"Blinds"}, items = {the_auroch} }