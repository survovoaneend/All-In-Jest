local the_aspen = {
    object_type = "Blind",
    key = 'the_aspen',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("efd265"),
    atlas = 'blinds',
    pos = { X = 0, y = 40},
    order = 19,
    dollars = 5,

    set_blind = function(self)
        local blinds_defeated = 0
        for k, v in pairs(G.GAME.round_resets.blind_states) do
            if v == 'Defeated' then
                blinds_defeated = blinds_defeated + 2
            end
        end
        local amt = G.GAME.blind.mult
        G.GAME.blind.mult = G.GAME.blind.mult + blinds_defeated
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
return { name = {"Blinds"}, items = {the_aspen} }