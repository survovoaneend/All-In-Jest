local the_twin = {
    object_type = "Blind",
    key = 'the_twin',
    boss = {
        min = 4,
    },
    in_pool = function(self)
        if G.playing_cards then
            local count = 0
            for k, v in ipairs(G.playing_cards) do
                if next(SMODS.get_enhancements(v)) then
                    count = count + 1
                end
            end
            return count >= 8
        end
    end,
    mult = 2,
    boss_colour = HEX("009cfd"),
    atlas = 'blinds',
    pos = { X = 0, y = 46},
    order = 25,
    dollars = 5,


    calculate = function(self, blind, context)
        
    end,

    stay_flipped = function(self, area, card)
        if area == G.hand then
            if next(SMODS.get_enhancements(card)) then
                return true
            end
        end
    end,

    disable = function(self)
        for k, v in pairs(G.hand.cards) do
            if v.facing == 'back' then
                v:flip()
            end
            for k, v in pairs(G.playing_cards) do
                v.ability.wheel_flipped = nil
            end
        end
    end,

    defeat = function(self)
        for k, v in pairs(G.hand.cards) do
            if v.facing == 'back' then
                v:flip()
            end
            for k, v in pairs(G.playing_cards) do
                v.ability.wheel_flipped = nil
            end
        end
    end

}
return { name = {"Blinds"}, items = {the_twin} }