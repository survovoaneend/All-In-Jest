local the_hazel = {
    object_type = "Blind",
    key = 'the_hazel',
    ignore = true,
    boss = {
      min = 2,
    },
    mult = 2,
    boss_colour = HEX("a5722c"),
    atlas = 'blinds',
    pos = {X = 0, y = 35 },
    order = 9,
    dollars = 5,

    calculate = function(self, card, context)
        
    end
}

return { name = {"Blinds"}, items = {the_hazel} }