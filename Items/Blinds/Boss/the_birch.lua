local the_birch = {
    object_type = "Blind",
    key = 'the_birch',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("5b9baa"),
    atlas = 'blinds',
    pos = { X = 0, y = 27},
    order = 45,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_birch} }