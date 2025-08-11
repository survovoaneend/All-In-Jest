local the_twin = {
    object_type = "Blind",
    key = 'the_twin',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("009cfd"),
    atlas = 'blinds',
    pos = { X = 0, y = 46},
    order = 25,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_twin} }