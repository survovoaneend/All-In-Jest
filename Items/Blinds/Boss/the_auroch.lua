local the_auroch = {
    object_type = "Blind",
    key = 'the_auroch',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("7a7f89"),
    atlas = 'blinds',
    pos = { X = 0, y = 35},
    order = 27,
    dollars = 5,

    loc_vars = function(self)
        return {
            vars = {G.GAME.current_round.aij_the_auroch.suit, G.GAME.current_round.aij_the_auroch.rank}
        }
    end,

    collection_loc_vars = function(self)
        return {
            vars = {'(Most common suit)', '(Most common rank)'}
        }
    end,

    stay_flipped = function(self, area, card)
        if G.GAME.current_round.aij_the_auroch and G.GAME.current_round.aij_the_auroch.suit and G.GAME.current_round.aij_the_auroch.rank and area == G.hand then
            if card.base.suit == G.GAME.current_round.aij_the_auroch.suit or card.base.value == G.GAME.current_round.aij_the_auroch.rank then
                return true
            end
        end
    end,

}
return { name = {"Blinds"}, items = {the_auroch} }