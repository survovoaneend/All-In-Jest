local the_horror = {
    object_type = "Blind",
    key = 'the_horror',
    ignore = true,
    boss = {
      min = 3,
    },
    mult = 2,
    boss_colour = HEX("58696c"),
    atlas = 'blinds',
    pos = {X = 0, y = 32 },
    order = 6,
    dollars = 5,

    calculate = function(self, card, context)
        
    end
}

return { name = {"Blinds"}, items = {the_horror} }