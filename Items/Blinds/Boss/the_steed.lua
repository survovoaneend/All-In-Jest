local the_steed = {
    object_type = "Blind",
    key = 'the_steed',
    
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("cfd1d5"),
    atlas = 'blinds',
    pos = { X = 0, y = 55},
    order = 46,
    dollars = 5,

    calculate = function(self, card, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.after and not temp then
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            for i = 1, #G.hand.cards do
                if not G.hand.cards[i].debuffed then
                    G.E_MANAGER:add_event(Event({func = function() SMODS.debuff_card(G.hand.cards[i], true, 'the_steed') G.hand.cards[i]:juice_up(); return true end })) 
                end
            end
            return true end })) 
        end
    end,
    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_steed')
        end
    end,

    defeat = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_steed')
        end
    end

}
return { name = {"Blinds"}, items = {the_steed} }