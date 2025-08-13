local the_sun = {
    object_type = "Blind",
    key = 'the_sun',
    ignore = true,
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("c7b24a"),
    atlas = 'blinds',
    pos = { X = 0, y = 59},
    order = 43,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_sun} }