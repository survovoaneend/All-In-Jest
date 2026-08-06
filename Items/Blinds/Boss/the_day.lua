local the_day = {
    object_type = "Blind",
    key = 'the_day',
    
    boss = {
        min = 1,
    },
    mult = 2,
    boss_colour = HEX("fda9c0"),
    atlas = 'blinds',
    pos = { X = 0, y = 46},
    order = 35,
    dollars = 5,


    calculate = function(self, blind, context)
        
    end,
    debuff_hand = function(self, cards, hand, handname, check)
        local value = 0
        if cards then
            for k, v in ipairs(cards) do
                if v:is_suit("Diamonds") or v:is_suit("Hearts")then
                    value = value + 1
                end
            end
        end
        if value and value > 0 then
            return false
        else
            G.GAME.blind.triggered = true
            return true
        end
    end

}
return { name = {"Blinds"}, items = {the_day} }