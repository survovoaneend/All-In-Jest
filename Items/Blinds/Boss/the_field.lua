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
    config = { extra = { cards = 0, defeated = false } },

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp or (not G.GAME.blind.in_blind) then
            return
        end
        if G.GAME.blind.ability and context.discard and not temp and not G.GAME.blind.ability.extra.defeated then
            G.GAME.blind.ability.extra.cards = G.GAME.blind.ability.extra.cards + 1    
            if G.GAME.blind.ability.extra.cards >= 10 then
                for k, v in pairs(G.playing_cards) do
                    SMODS.debuff_card(v, false, 'the_field')
                end
            end
        end
        if G.GAME.blind.ability and G.GAME.blind.ability.extra.cards < 10 and not temp and not G.GAME.blind.ability.extra.defeated then
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
