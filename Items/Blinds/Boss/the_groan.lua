local the_groan = {
    object_type = "Blind",
    key = 'the_groan',
    ignore = true,
    boss = {
        min = 4,
    },
    mult = 2,
    boss_colour = HEX("3d6065"),
    atlas = 'blinds',
    pos = { X = 0, y = 37 },
    order = 16,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_groan} }