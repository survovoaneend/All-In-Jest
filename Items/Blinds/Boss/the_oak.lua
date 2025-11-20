local the_oak = {
    object_type = "Blind",
    key = 'the_oak',
    boss = {
      min = 3,
    },
    mult = 2,
    boss_colour = HEX("b9a072"),
    atlas = 'blinds',
    pos = {X = 0, y = 33 },
    order = 7,
    dollars = 5,

    recalc_debuff = function(self, card, from_blind)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return false
        end
        if card.ability.aij_the_oak_debuff then
            SMODS.debuff_card(card, false, 'the_oak')
            card.ability.aij_the_oak_debuff = false
        end
        if card.area == G.jokers and #G.jokers > 0 and card == G.jokers[#G.jokers] and not temp then
            SMODS.debuff_card(card, true, 'the_oak')
            card.ability.aij_the_oak_debuff = true
            return true
        end
        return false
    end,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if G.jokers and #G.jokers.cards > 0 and not temp then
            for k, v in pairs(G.jokers.cards) do
                if v == G.jokers.cards[#G.jokers.cards] then
                    SMODS.debuff_card(v, true, 'the_oak')
                    v.ability.aij_the_oak_debuff = true
                elseif v.ability.aij_the_oak_debuff then
                    SMODS.debuff_card(v, false, 'the_oak')
                    v.ability.aij_the_oak_debuff = false
                end
            end
        end
    end,

    update = function(self, blind, dt)
        if blind then
            local temp = blind and blind.disabled
            if temp then
                if G.jokers and #G.jokers.cards > 0 then
                    for k, v in pairs(G.jokers.cards) do
                        if v.ability.aij_the_oak_debuff then
                            SMODS.debuff_card(v, false, 'the_oak')
                            v.ability.aij_the_oak_debuff = false
                        end
                    end
                end
                return
            end
            if G.jokers and #G.jokers.cards > 0 and not temp then
                for k, v in pairs(G.jokers.cards) do
                    if v == G.jokers.cards[#G.jokers.cards] then
                        SMODS.debuff_card(v, true, 'the_oak')
                        v.ability.aij_the_oak_debuff = true
                    elseif v.ability.aij_the_oak_debuff then
                        SMODS.debuff_card(v, false, 'the_oak')
                        v.ability.aij_the_oak_debuff = false
                    end
                end
            end
        end
    end,

    disable = function(self)
        for k, v in pairs(G.jokers.cards) do
            SMODS.debuff_card(v, false, 'the_oak')
        end
    end,

    defeat = function(self)
        G.GAME.blind.disabled = true
        for k, v in pairs(G.jokers.cards) do
            SMODS.debuff_card(v, false, 'the_oak')
        end
    end
}
return { name = {"Blinds"}, items = {the_oak} }
