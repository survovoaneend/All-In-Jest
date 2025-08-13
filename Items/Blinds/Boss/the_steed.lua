local the_steed = {
    object_type = "Blind",
    key = 'the_steed',
    ignore = true,
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("cfd1d5"),
    atlas = 'blinds',
    pos = { X = 0, y = 55},
    order = 46,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_steed} }