local the_celebration = {
    object_type = "Blind",
    key = 'the_celebration',
    ignore = true,
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("ff6368"),
    atlas = 'blinds',
    pos = { X = 0, y = 49},
    order = 36,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_celebration} }