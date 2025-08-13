local the_need = {
    object_type = "Blind",
    key = 'the_need',
    ignore = true,
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("98c350"),
    atlas = 'blinds',
    pos = { X = 0, y = 25},
    order = 34,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_need} }