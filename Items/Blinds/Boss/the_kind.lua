local the_kind = {
    object_type = "Blind",
    key = 'the_kind',
    
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("de7559"),
    atlas = 'blinds',
    pos = { X = 0, y = 52},
    ignore = true,
    order = 53,
    dollars = 5,

    aij_blind_amount_display = function(self, blind, base_blind_amount, mult)
        local skipped = 0
        for k, v in pairs(G.GAME.round_resets.blind_states) do
            if G.GAME.round_resets.blind_states[k] == 'Skipped' then
                skipped = skipped + 1
            end
        end
        if skipped > 0 then
            local extra_mult = skipped * 2
            return base_blind_amount * (mult + extra_mult)
        end
    end,

    set_blind = function(self)
        local skipped = 0
        for k, v in pairs(G.GAME.round_resets.blind_states) do
            if G.GAME.round_resets.blind_states[k] == 'Skipped' then
                skipped = skipped + 1
            end
        end
        if skipped > 0 then
            All_in_Jest.ease_blind_requirement(skipped * 2, 0)
        end
    end,

    disable = function()
        G.GAME.blind.chips = G.GAME.blind.aij_original_chips
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,

    defeat = function(self)
        G.has_been_bl_aij_the_kind = nil
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
    end
}
return { name = {"Blinds"}, items = {the_kind} }