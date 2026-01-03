local aij_ease_dollars_ref = ease_dollars
function ease_dollars(mod, instant)
    ret = aij_ease_dollars_ref(mod, instant)
    if to_big(mod) < to_big(0) then
        G.GAME.current_round.aij_aureate_coin_blind.spent_money = G.GAME.current_round.aij_aureate_coin_blind.spent_money + mod
        if G.GAME.round_resets.blind_choices.Boss == "bl_aij_aureate_coin" then
            G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                All_in_Jest.aij_refresh_boss_blind() -- Updates dynamic score requirement
                return true
            end
            }))
        end
    end
    return ret
end

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
    aij_variable_req = true,
    boss_colour = HEX("eba03a"),
    atlas = 'blinds_final',
    pos = { y = 0 },
    order = 1001,
    dollars = 8,
    config = {extra = {trigger = false}},

    aij_blind_amount_display = function(self, blind, base_blind_amount, mult)
        if G.GAME.current_round.aij_aureate_coin_blind then
            local extra_mult = math.abs(G.GAME.current_round.aij_aureate_coin_blind.spent_money) * 0.1
            return base_blind_amount * (mult + extra_mult)
        end
    end,

    set_blind = function(self)
        if G.GAME.current_round.aij_aureate_coin_blind and math.abs(G.GAME.current_round.aij_aureate_coin_blind.spent_money) > 0 then
            All_in_Jest.ease_blind_requirement(math.abs(G.GAME.current_round.aij_aureate_coin_blind.spent_money) * 0.1, 0)
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

return { name = {"Finisher Blinds"}, items = {aureate_coin} }