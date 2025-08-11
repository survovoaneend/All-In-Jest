local the_ash = {
    object_type = "Blind",
    key = 'the_ash',
    boss = {
        min = 5,
    },
    mult = 2,
    boss_colour = HEX("97896f"),
    atlas = 'blinds',
    pos = { X = 0, y = 38 },
    order = 17,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_ash} }