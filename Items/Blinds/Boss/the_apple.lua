local the_apple = {
    object_type = "Blind",
    key = 'the_apple',
    boss = {
      min = 3,
    },
    mult = 2,
    boss_colour = HEX("ac3232"),
    atlas = 'blinds',
    pos = {X = 0, y = 36 },
    order = 10,
    dollars = 5,

    calculate = function(self, card, context)
        
    end
}

return { name = {"Blinds"}, items = {the_apple} }