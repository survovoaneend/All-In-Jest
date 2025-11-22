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
        local unused = (G.GAME.all_in_jest.unused_discards.ante + G.GAME.all_in_jest.unused_hands.ante)
        All_in_Jest.ease_blind_requirement(unused * 0.2, 0)
    end,

    disable = function()
        G.GAME.blind.chips = G.GAME.blind.original_chips
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,

    defeat = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
    end

}
return { name = {"Blinds"}, items = {the_celebration} }