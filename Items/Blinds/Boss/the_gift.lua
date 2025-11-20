local the_gift = {
    object_type = "Blind",
    key = 'the_gift',

    boss = {
        min = 3,
        money = 0
    },
    mult = 2,
    boss_colour = HEX("c75d5d"),
    atlas = 'blinds',
    pos = { X = 0, y = 60},
    order = 29,
    dollars = 5,

    set_blind = function(self)
        self.boss.money = G.GAME.dollars
        ease_dollars(-self.boss.money, true)
    end,
    disable = function(self)
        ease_dollars(self.boss.money, true)
    end,
    press_play = function(self)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
        for i = 1, #G.play.cards do
            G.E_MANAGER:add_event(Event({func = function() G.play.cards[i]:juice_up(); return true end })) 
            ease_dollars(1)
            delay(0.23)
        end
        return true end })) 
        self.triggered = true
        return true
    end,
    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.discard and not temp then 
            if not context.other_card.debuff then
                ease_dollars(1)
                delay(0.23)
            end
        end
    end,

}
return { name = {"Blinds"}, items = {the_gift} }