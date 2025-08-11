local the_enigma = {
    object_type = "Blind",
    key = 'the_enigma',
    boss = {
        min = 4,
    },
    mult = 1.5,
    boss_colour = HEX("6b4d74"),
    atlas = 'blinds',
    pos = { X = 0, y = 42},
    order = 21,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

}
return { name = {"Blinds"}, items = {the_enigma} }