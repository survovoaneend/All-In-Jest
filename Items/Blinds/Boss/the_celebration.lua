local the_celebration = {
    object_type = "Blind",
    key = 'the_celebration',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("ff6368"),
    atlas = 'blinds',
    pos = { X = 0, y = 49},
    order = 36,
    dollars = 5,


    set_blind = function(self)
        local unused = (G.GAME.all_in_jest.unused_discards.ante + G.GAME.all_in_jest.unused_hands.ante) * 0.2
        local amt = G.GAME.blind.mult
        G.GAME.blind.mult = G.GAME.blind.mult + unused
        G.GAME.blind.chips = G.GAME.blind.chips/amt
        G.GAME.blind.chips = G.GAME.blind.chips*G.GAME.blind.mult
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
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
return { name = {"Blinds"}, items = {the_celebration} }