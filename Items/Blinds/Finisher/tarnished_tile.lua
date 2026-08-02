local tarnished_tile = {
    object_type = "Blind",
    key = 'tarnished_tile',
    boss = {
      min = 1,
      showdown = true,
    },
    in_pool = function(self)
        return true
    end,
    mult = 2,
    boss_colour = HEX("f28a3c"),
    atlas = 'blinds_final',
    pos = { y = 14},
    order = 1015,
    dollars = 8,

    set_blind = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        G.hand:change_size(G.hand.config.card_limit)
        G.GAME.tarnished_tile_reset_handsize = G.hand.config.card_limit
        G.GAME.round_resets.temp_handsize = (G.GAME.round_resets.temp_handsize or 0) + G.hand.config.card_limit
        G.GAME.blind.triggered = true
    end,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.first_hand_drawn and not temp then
            G.FUNCS.aij_draw_from_discard_to_deck(nil, true)
        end
    end,

    disable = function(self)
        if G.GAME.blind.triggered then
            G.hand:change_size(-G.GAME.tarnished_tile_reset_handsize)
            G.GAME.round_resets.temp_handsize = (G.GAME.round_resets.temp_handsize or 0) - G.GAME.tarnished_tile_reset_handsize
        end
    end,

    defeat = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
    end
}
return { name = {"Finisher Blinds"}, items = {tarnished_tile} }
