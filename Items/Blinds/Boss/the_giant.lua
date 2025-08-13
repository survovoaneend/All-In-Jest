local the_giant = {
    object_type = "Blind",
    key = 'the_giant',
    ignore = true,
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("7a73bb"),
    atlas = 'blinds',
    pos = { X = 0, y = 47},
    order = 26,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_giant} }