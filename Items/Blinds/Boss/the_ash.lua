local the_ash = {
    object_type = "Blind",
    key = 'the_ash',
    boss = {
        min = 5,
    },
    mult = 2,
    boss_colour = HEX("97896f"),
    atlas = 'blinds',
    pos = { X = 0, y = 38 },
    order = 17,
    dollars = 5,

    loc_vars = function(self)
        return {
            vars = {G.GAME.all_in_jest.starting_prams.deck_size}
        }
    end,

    collection_loc_vars = function(self)
        return {
            vars = {'[Starting size]'}
        }
    end,

    set_blind = function(self)
        local extra_mult = 0
        if #G.deck.cards <= G.GAME.all_in_jest.starting_prams.deck_size then
            extra_mult = (G.GAME.all_in_jest.starting_prams.deck_size - #G.deck.cards) * 0.2
        end
        local amt = G.GAME.blind.mult
        G.GAME.blind.mult = G.GAME.blind.mult + extra_mult
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
    end,

    in_pool = function(self)
        if G.deck and #G.deck.cards <= G.GAME.all_in_jest.starting_prams.deck_size then
            return true
        end
    end,
}
return { name = {"Blinds"}, items = {the_ash} }