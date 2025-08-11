local the_beast = {
    object_type = "Blind",
    key = 'the_beast',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("4a834c"),
    atlas = 'blinds',
    pos = { X = 0, y = 52},
    order = 32,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_beast} }