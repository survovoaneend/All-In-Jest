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

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.all_in_jest and context.all_in_jest.drew_cards and not temp then
            All_in_Jest.ease_blind_requirement(1, 0)
            self.triggered = true
        end
    end,

    disable = function()
        G.GAME.blind.chips = G.GAME.blind.aij_original_chips
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,

    defeat = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
    end

}
return { name = { "Blinds" }, items = { the_groan } }
