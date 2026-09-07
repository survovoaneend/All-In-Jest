local the_man = {
    object_type = "Blind",
    key = 'the_man',
    
    boss = {
        min = 2,
    },
    mult = 2,
    attributes = {'face_down'},
    boss_colour = HEX("95a0a9"),
    atlas = 'blinds',
    pos = { X = 0, y = 64},
    order = 65,
    dollars = 5,

    stay_flipped = function(self, area, card)
        if area == G.hand and card.ability.played_this_ante then
            return true
        end
    end,

    calculate = function(self, blind, context)

    end
}
return { name = {"Blinds"}, items = {the_man} }