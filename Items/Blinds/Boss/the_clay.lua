local the_clay = {
    object_type = "Blind",
    key = 'the_clay',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("95a4a9"),
    atlas = 'blinds',
    pos = { X = 0, y = 39},
    order = 18,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_clay} }