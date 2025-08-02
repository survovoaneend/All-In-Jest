local the_field = {
    object_type = "Blind",
    key = 'the_field',
    boss = {
        min = 1,
    },
    mult = 2,
    boss_colour = HEX("95ac6e"),
    atlas = 'blinds',
    pos = { X = 0, y = 20 },
    order = 12,
    dollars = 5,
    config = { extra = { cards = 0, triggered = false } },

    recalc_debuff = function(self, card, from_blind)
        if card.area ~= G.jokers then
            return true
        end
    end,

    calculate = function(self, card, context)
        if context.discard then
            self.config.extra.cards = self.config.extra.cards + 1    
            if self.config.extra.cards >= 10 and not self.config.extra.triggered then
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        self.config.extra.triggered = true
                        G.GAME.blind:disable()
                        return true
                    end
                }))
            end
        end
    end,
    defeat = function(self)
        self.config.extra.triggered = false
        self.config.extra.cards = 0
    end

}
return { name = { "Blinds" }, items = { the_field } }
