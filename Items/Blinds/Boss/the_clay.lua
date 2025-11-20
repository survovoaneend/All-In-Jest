local the_clay = {
    object_type = "Blind",
    key = 'the_clay',
    boss = {
        min = 3,
    },
    mult = 1,
    boss_colour = HEX("95a4a9"),
    atlas = 'blinds',
    pos = { X = 0, y = 39},
    order = 18,
    dollars = 5,


    calculate = function(self, blind, context)
        
    end,

    disable = function(self)
        local minusamt = (G.GAME.blind.mult - 1)
        local amt = minusamt + 1
        G.GAME.blind.chips = G.GAME.blind.chips/amt
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,

    defeat = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if not temp then
            local minusamt = (G.GAME.blind.mult - 2) / 2
            local amt = minusamt + 1
            G.GAME.blind.chips = G.GAME.blind.chips/amt
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        end
    end

}
-- code in aureate coin
return { name = {"Blinds"}, items = {the_clay} }
