local the_bullion = {
    object_type = "Blind",
    key = 'the_bullion',
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
    mult = 2,
    boss_colour = HEX("f3aa46"),
    atlas = 'blinds',
    pos = { X = 0, y = 43},
    order = 22,
    dollars = 5,


    calculate = function(self, card, context)
        
    end,

    press_play = function(self)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
        for i = 1, #G.play.cards do
            if next(SMODS.get_enhancements(G.play.cards[i])) then
                G.E_MANAGER:add_event(Event({func = function() G.play.cards[i]:juice_up(); return true end })) 
                ease_dollars(-5)
                delay(0.23)
            end
        end
        return true end })) 
        self.triggered = true
        return true
    end,

}
return { name = {"Blinds"}, items = {the_bullion} }