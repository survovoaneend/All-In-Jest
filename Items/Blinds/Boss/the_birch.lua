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


    recalc_debuff = function(self, card, from_blind)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp or SMODS.has_no_rank(card) or not card:get_id() then
            return false
        end
        if card.area ~= G.jokers and
            not SMODS.has_no_rank(card) and
            (card:get_id() <= 10 and
            card:get_id() >= 0 and
            card:get_id()%2 == 0) then
            return true
        end
        return false
    end,
    -- set_blind = function(self)
    --     local temp = G.GAME.blind and G.GAME.blind.disabled
    --     if temp or SMODS.has_no_rank(card) or not card:get_id() then
    --         return false
    --     end
    --     for _, card in pairs(G.playing_cards) do
    --         if not SMODS.has_no_rank(card) and card:get_id() and
    --             (card:get_id() <= 10 and
    --             card:get_id() >= 0 and
    --             card:get_id()%2 == 0) then
    --             SMODS.debuff_card(card, true, 'the_birch')
    --         end
    --     end
    -- end,

    -- disable = function(self)
    --     for _, card in pairs(G.playing_cards) do
    --         SMODS.debuff_card(card, false, 'the_birch')
    --     end
    -- end,

    -- defeat = function(self)
    --     for _, card in pairs(G.playing_cards) do
    --         SMODS.debuff_card(card, false, 'the_birch')
    --     end
    -- end

}
return { name = {"Blinds"}, items = {the_birch} }