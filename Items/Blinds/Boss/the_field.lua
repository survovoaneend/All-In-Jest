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
    config = { extra = { cards = 0 } },

    calculate = function(self, card, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.discard and not temp then
            self.config.extra.cards = self.config.extra.cards + 1    
            if self.config.extra.cards >= 10 then
                for k, v in pairs(G.playing_cards) do
                    SMODS.debuff_card(v, false, 'the_field')
                end
            end
        end
        if self.config.extra.cards < 10 and not temp then
            for k, v in pairs(G.playing_cards) do
                SMODS.debuff_card(v, true, 'the_field')
            end
        end
    end,

    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_field')
        end
    end,

    defeat = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_field')
        end
    end

}
return { name = { "Blinds" }, items = { the_field } }
