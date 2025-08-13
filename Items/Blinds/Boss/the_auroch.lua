local the_auroch = {
    object_type = "Blind",
    key = 'the_auroch',
    ignore = true,
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("7a7f89"),
    atlas = 'blinds',
    pos = { X = 0, y = 51},
    order = 27,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_auroch} }