local the_elbow = {
    object_type = "Blind",
    key = 'the_elbow',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("d3c1c1"),
    atlas = 'blinds',
    pos = { X = 0, y = 44},
    order = 23,
    dollars = 5,


    calculate = function(self, blind, context)
        
    end,
    in_pool = function(self)
        if G.playing_cards then
            local count = 0
            for k, v in ipairs(G.playing_cards) do
                if next(SMODS.get_enhancements(v)) then
                    count = count + 1
                end
            end
            return count >= 4
        end
    end,

}
return { name = {"Blinds"}, items = {the_elbow} }