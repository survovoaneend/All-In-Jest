local the_frost = {
    object_type = "Blind",
    key = 'the_frost',
    ignore = true,
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("d1d0dd"),
    atlas = 'blinds',
    pos = { X = 0, y = 58},
    order = 38,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_frost} }