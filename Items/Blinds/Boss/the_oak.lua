local the_oak = {
    object_type = "Blind",
    key = 'the_oak',
    boss = {
      min = 3,
    },
    mult = 2,
    boss_colour = HEX("b9a072"),
    atlas = 'blinds',
    pos = {X = 0, y = 33 },
    order = 7,
    dollars = 5,

    calculate = function(self, card, context)
        
    end
}
return { name = {"Blinds"}, items = {the_oak} }
