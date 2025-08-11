local the_god = {
    object_type = "Blind",
    key = 'the_god',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("9badaf"),
    atlas = 'blinds',
    pos = { X = 0, y = 48},
    order = 31,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_god} }