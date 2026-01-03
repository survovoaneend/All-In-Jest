local the_yew = {
    object_type = "Blind",
    key = 'the_yew',
    
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("f28a3c"),
    atlas = 'blinds',
    pos = { X = 0, y = 12},
    order = 39,
    dollars = 5,


    recalc_debuff = function(self, card, from_blind)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp or SMODS.has_no_rank(card) or not card:get_id() then
            return false
        end
        if card.area ~= G.jokers and
            not SMODS.has_no_rank(card) and
            ((card:get_id() <= 10 and
            card:get_id() >= 0 and
            card:get_id()%2 == 1) or
            (card:get_id() == 14)) then
            return true
        end
        return false
    end,
    -- set_blind = function(self)
    --     local temp = G.GAME.blind and G.GAME.blind.disabled
    --     if temp then
    --         return false
    --     end
    --     for _, card in pairs(G.playing_cards) do
    --         if not SMODS.has_no_rank(card) and card:get_id() and
    --             ((card:get_id() <= 10 and
    --             card:get_id() >= 0 and
    --             card:get_id()%2 == 1) or
    --             (card:get_id() == 14)) then
    --             SMODS.debuff_card(card, true, 'the_yew')
    --         end
    --     end
    -- end,

    -- disable = function(self)
    --     for _, card in pairs(G.playing_cards) do
    --         SMODS.debuff_card(card, false, 'the_yew')
    --     end
    -- end,

    -- defeat = function(self)
    --     for _, card in pairs(G.playing_cards) do
    --         SMODS.debuff_card(card, false, 'the_yew')
    --     end
    -- end

}
return { name = {"Blinds"}, items = {the_yew} }