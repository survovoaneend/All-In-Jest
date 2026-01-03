local the_figure = {
    object_type = "Blind",
    key = 'the_figure',
    
    boss = {
        min = 2,
    },
    mult = 2,
    boss_colour = HEX("615b91"),
    atlas = 'blinds',
    pos = { X = 0, y = 14},
    order = 47,
    dollars = 5,


    calculate = function(self, blind, context)
        
    end,
    debuff_hand = function(self, cards, hand, handname, check)
        local faces = 0
        if cards then
            for k, v in ipairs(cards) do
                if v:is_face() then
                    faces = faces + 1
                end
            end
        end
        if faces and faces >= 3 then
            G.GAME.blind.triggered = true
            return true
        else
            return false
        end
    end

}
return { name = {"Blinds"}, items = {the_figure} }