local the_neck = {
    object_type = "Blind",
    key = 'the_neck',
    boss = {
      min = 2,
    },
    mult = 2,
    boss_colour = HEX("dfab55"),
    atlas = 'blinds',
    pos = {X = 0, y = 19 },
    order = 11,
    dollars = 5,

    calculate = function(self, card, context)
        
    end
    
}
--override for discard function is located in the_blush.lua

return { name = {"Blinds"}, items = {the_neck} }