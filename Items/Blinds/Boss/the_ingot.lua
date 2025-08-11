local the_ingot = {
    object_type = "Blind",
    key = 'the_ingot',
    boss = {
      min = 5,
    },
    mult = 2,
    boss_colour = HEX("dfd8ca"),
    atlas = 'blinds',
    pos = {X = 0, y = 34 },
    order = 8,
    dollars = 5,

    calculate = function(self, card, context)
        
    end
}

return { name = {"Blinds"}, items = {the_ingot} }