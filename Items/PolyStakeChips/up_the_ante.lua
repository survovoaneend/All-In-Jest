local up_the_ante = {
    object_loader = All_in_Jest,
    object_type = "PolyStakeChip",
    order = 1,
    key = "up_the_ante",
    pos = { x = 1, y = 0 },
    atlas = "chips_atlas",
    stack = 3,
    points = { 75, 300, 600 },
    apply = function(self, stack)
        G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + stack
    end
}

-- define our own scaling for 3rd stack instead of it being calculated automatically
local get_blind_amount_ref = SMODS.get_blind_amount
function SMODS.get_blind_amount(ante)
    if G.GAME.aij_poly_chips and G.GAME.aij_poly_chips['aij_up_the_ante'] == 3 then
        local amounts = { 300, 1050, 3600, 14000, 40000, 90000, 210000, 500000 }
        if ante < 1 then return 100 end
        if ante <= 8 then return amounts[ante] end
        local a, b, c, d = amounts[8], amounts[8]/amounts[7], ante-8, 1 + 0.2*(ante-8)
        local amount = math.floor(a*(b + (0.75*c)^d)^c)
        amount = amount - amount%(10^math.floor(math.log10(amount)-1))
        return amount
    end
    return get_blind_amount_ref(ante)
end

return { name = { "PolyStakeChips" }, items = { up_the_ante } }