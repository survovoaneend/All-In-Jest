local the_thorn = {
    object_type = "Blind",
    key = 'the_thorn',
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
            return count >= 4
        end
    end,
    mult = 1,
    boss_colour = HEX("56a786"),
    atlas = 'blinds',
    pos = { X = 0, y = 45},
    order = 24,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

    set_blind = function(self)
        for k, v in pairs(G.playing_cards) do
            if next(SMODS.get_enhancements(v)) then
                SMODS.debuff_card(v, true, 'the_thorn')
            end
        end
    end,

    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_thorn')
        end
    end,

     defeat = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_thorn')
        end
    end

}
return { name = {"Blinds"}, items = {the_thorn} }