local the_real = {
    object_type = "Blind",
    key = 'the_real',
    
    boss = {
        min = 1,
    },
    mult = 2,
    boss_colour = HEX("3e4b4d"),
    atlas = 'blinds',
    pos = { X = 0, y = 53},
    order = 54,
    dollars = 5,


    calculate = function(self, blind, context)
        
    end
}
return { name = {"Blinds"}, items = {the_real} }