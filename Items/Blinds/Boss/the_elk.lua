local the_elk = {
    object_type = "Blind",
    key = 'the_elk',
    ignore = true,
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("b575e8"),
    atlas = 'blinds',
    pos = { X = 0, y = 54},
    order = 42,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_elk} }