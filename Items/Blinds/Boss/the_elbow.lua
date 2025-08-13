local the_elbow = {
    object_type = "Blind",
    key = 'the_elbow',
    ignore = true,
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("d3c1c1"),
    atlas = 'blinds',
    pos = { X = 0, y = 44},
    order = 23,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_elbow} }