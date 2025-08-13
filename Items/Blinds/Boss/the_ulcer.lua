local the_ulcer = {
    object_type = "Blind",
    key = 'the_ulcer',
    ignore = true,
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("e39571"),
    atlas = 'blinds',
    pos = { X = 0, y = 24},
    order = 33,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_ulcer} }