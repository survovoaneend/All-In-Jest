local the_gift = {
    object_type = "Blind",
    key = 'the_gift',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("c75d5d"),
    atlas = 'blinds',
    pos = { X = 0, y = 60},
    order = 29,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_gift} }