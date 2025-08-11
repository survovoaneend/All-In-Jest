local the_yew = {
    object_type = "Blind",
    key = 'the_yew',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("f28a3c"),
    atlas = 'blinds',
    pos = { X = 0, y = 26},
    order = 39,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_yew} }