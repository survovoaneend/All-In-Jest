local the_evergreen = {
    object_type = "Blind",
    key = 'the_evergreen',
    boss = {
        min = 5,
    },
    mult = 2,
    boss_colour = HEX("62844b"),
    atlas = 'blinds',
    pos = { X = 0, y = 41},
    order = 20,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_evergreen} }