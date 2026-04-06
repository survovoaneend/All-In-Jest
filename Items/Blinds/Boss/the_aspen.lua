local the_aspen = {
    object_type = "Blind",
    key = 'the_aspen',
    boss = {
        min = 3,
    },
    mult = 1,
    boss_colour = HEX("efd265"),
    atlas = 'blinds',
    pos = { X = 0, y = 40},
    order = 19,
    dollars = 5,

    aij_blind_amount_display = function(self, blind, base_blind_amount, mult)
        local blinds_defeated = 0
        for _, v in pairs(G.GAME.round_resets.blind_states) do
            if v == 'Defeated' then
                blinds_defeated = blinds_defeated + 1
            end
        end
        return base_blind_amount * (mult + blinds_defeated * 2)
    end,

    set_blind = function(self)
        local blinds_defeated = 0
        for _, v in pairs(G.GAME.round_resets.blind_states) do
            if v == 'Defeated' then
                blinds_defeated = blinds_defeated + 1
            end
        end
        if blinds_defeated > 0 then
            All_in_Jest.ease_blind_requirement(blinds_defeated * 2, 0)
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
return { name = {"Blinds"}, items = {the_aspen} }