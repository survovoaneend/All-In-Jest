local the_storm = {
    object_type = "Blind",
    key = 'the_storm',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("b48b52"),
    atlas = 'blinds',
    pos = { X = 0, y = 53},
    order = 37,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_storm} }