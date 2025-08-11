local the_spear = {
    object_type = "Blind",
    key = 'the_spear',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("56a786"),
    atlas = 'blinds',
    pos = { X = 0, y = 57},
    order = 44,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_spear} }