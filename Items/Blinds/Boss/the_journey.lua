local the_journey = {
    object_type = "Blind",
    key = 'the_journey',
    ignore = true,
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("fdd879"),
    atlas = 'blinds',
    pos = { X = 0, y = 56},
    order = 28,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_journey} }