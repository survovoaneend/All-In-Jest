local the_figure = {
    object_type = "Blind",
    key = 'the_figure',
    ignore = true,
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("615b91"),
    atlas = 'blinds',
    pos = { X = 0, y = 28},
    order = 47,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_figure} }