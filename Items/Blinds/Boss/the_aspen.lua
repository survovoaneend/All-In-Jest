local the_aspen = {
    object_type = "Blind",
    key = 'the_aspen',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("efd265"),
    atlas = 'blinds',
    pos = { X = 0, y = 40},
    order = 19,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_aspen} }