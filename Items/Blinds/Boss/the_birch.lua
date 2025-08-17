local the_birch = {
    object_type = "Blind",
    key = 'the_birch',
    
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("5b9baa"),
    atlas = 'blinds',
    pos = { X = 0, y = 27},
    order = 45,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,
    set_blind = function(self)
        for k, v in pairs(G.playing_cards) do
            if v:get_id() <= 10 and 
                v:get_id() >= 0 and
                v:get_id()%2 == 0 then
                SMODS.debuff_card(v, true, 'the_birch')
            end
        end
    end,

    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_birch')
        end
    end,

     defeat = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_birch')
        end
    end

}
return { name = {"Blinds"}, items = {the_birch} }