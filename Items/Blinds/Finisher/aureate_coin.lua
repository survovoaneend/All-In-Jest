local aureate_coin = {
    object_type = "Blind",
    key = 'aureate_coin',
    boss = {
      min = 1,
      showdown = true,
    },
    in_pool = function(self)
        return true
    end,
    mult = 2,
    boss_colour = HEX("eba03a"),
    atlas = 'blinds',
    pos = { y = 30 },
    order = 1001,
    dollars = 8,

    disable = function(self)
        local minusamt = (G.GAME.blind.mult - 2) / 2
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
local ease_anteref = ease_ante
function ease_ante(mod)
    if mod ~= 0 then
        G.P_BLINDS['bl_aij_aureate_coin'].mult = (G.GAME.dollars * 0.1) + 2
    end
    
    local ref = ease_anteref(mod)
    return ref
end
return { name = {"Finisher Blinds"}, items = {aureate_coin} }
