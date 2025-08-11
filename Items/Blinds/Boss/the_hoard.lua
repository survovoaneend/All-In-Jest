local the_hoard = {
    object_type = "Blind",
    key = 'the_hoard',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("7a73bb"),
    atlas = 'blinds',
    pos = { X = 0, y = 63},
    order = 40,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_hoard} }