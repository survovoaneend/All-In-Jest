local the_lake = {
    object_type = "Blind",
    key = 'the_lake',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("449d95"),
    atlas = 'blinds',
    pos = { X = 0, y = 29},
    order = 48,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_lake} }