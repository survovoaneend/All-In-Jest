local the_groan = {
    object_type = "Blind",
    key = 'the_groan',
    boss = {
        min = 4,
    },
    mult = 2,
    boss_colour = HEX("3d6065"),
    atlas = 'blinds',
    pos = { X = 0, y = 37 },
    order = 16,
    dollars = 5,

    calculate = function(self, card, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.all_in_jest and context.all_in_jest.drew_cards and not temp then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    local amt = G.GAME.blind.mult
                    G.GAME.blind.mult = G.GAME.blind.mult + 1
                    G.GAME.blind.chips = G.GAME.blind.chips/amt
                    G.GAME.blind.chips = G.GAME.blind.chips*G.GAME.blind.mult
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                return true
                end
            }))
        end
    end,

    disable = function(self)
        local amt = G.GAME.blind.mult
        G.GAME.blind.chips = G.GAME.blind.chips/amt
        G.GAME.blind.chips = G.GAME.blind.chips*2
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,

    defeat = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if not temp then
            local amt = G.GAME.blind.mult
            G.GAME.blind.chips = G.GAME.blind.chips/amt
            G.GAME.blind.chips = G.GAME.blind.chips*2
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        end
    end

}
return { name = {"Blinds"}, items = {the_groan} }