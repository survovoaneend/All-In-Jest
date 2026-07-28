local the_sun = {
    object_type = "Blind",
    key = 'the_sun',

    boss = {
        min = 2,
    },
    mult = 2,
    boss_colour = HEX("c7b24a"),
    atlas = 'blinds',
    pos = { X = 0, y = 43},
    order = 43,
    dollars = 5,


    calculate = function(self, blind, context)
        
    end,
    stay_flipped = function(self, area, card)
        if area == G.hand then
            if card:is_suit("Spades") or card:is_suit("Clubs") then
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
return { name = {"Blinds"}, items = {the_sun} }