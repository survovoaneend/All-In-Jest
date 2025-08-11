local the_thorn = {
    object_type = "Blind",
    key = 'the_thorn',
    boss = {
        min = 3,
    },
    mult = 1,
    boss_colour = HEX("56a786"),
    atlas = 'blinds',
    pos = { X = 0, y = 45},
    order = 24,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_thorn} }