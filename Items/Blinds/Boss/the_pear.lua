local the_pear = {
    object_type = "Blind",
    key = 'the_pear',
    ignore = true,
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("84b1d2"),
    atlas = 'blinds',
    pos = { X = 0, y = 50},
    order = 41,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_pear} }