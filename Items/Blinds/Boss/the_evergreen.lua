local the_evergreen = {
    object_type = "Blind",
    key = 'the_evergreen',
    boss = {
        min = 5,
    },
    mult = 2,
    boss_colour = HEX("62844b"),
    atlas = 'blinds',
    pos = { X = 0, y = 41},
    order = 20,
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
            extra_mult = (#G.deck.cards - G.GAME.all_in_jest.starting_prams.deck_size) * 0.20
        end
        All_in_Jest.ease_blind_requirement(extra_mult, 0)
    end,

    disable = function()
        G.GAME.blind.chips = G.GAME.blind.original_chips
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,

    defeat = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
    end,

    in_pool = function(self)
        if G.deck and #G.deck.cards > G.GAME.all_in_jest.starting_prams.deck_size then
            return (#G.deck.cards - G.GAME.all_in_jest.starting_prams.deck_size) >= 2
        end
    end,
}
return { name = {"Blinds"}, items = {the_evergreen} }