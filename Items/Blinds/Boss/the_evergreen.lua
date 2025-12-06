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

    aij_blind_amount_display = function(self, blind, base_blind_amount, mult)
        local extra_mult = 0
        if #G.deck.cards >= G.GAME.all_in_jest.starting_prams.deck_size then
            extra_mult = (#G.deck.cards - G.GAME.all_in_jest.starting_prams.deck_size) * 0.20
        end
        return base_blind_amount * (mult + extra_mult)
    end,

    set_blind = function(self)
        local extra_mult = 0
        if #G.deck.cards >= G.GAME.all_in_jest.starting_prams.deck_size then
            extra_mult = (#G.deck.cards - G.GAME.all_in_jest.starting_prams.deck_size) * 0.20
        end
        All_in_Jest.ease_blind_requirement(extra_mult, 0)
    end,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.playing_card_added then
            local extra_mult = #context.cards * 0.2
            if extra_mult ~= 0 then
                All_in_Jest.ease_blind_requirement(extra_mult, 0)
                blind.triggered = true
            end
        end
        if context.remove_playing_cards then
            local extra_mult = #context.removed * -0.2
            if (All_in_Jest.get_current_blind_mult() + extra_mult) < G.GAME.blind.aij_original_mult then
                extra_mult = G.GAME.blind.aij_original_mult - All_in_Jest.get_current_blind_mult()
            end
            if extra_mult ~= 0 then
                All_in_Jest.ease_blind_requirement(extra_mult, 0)
                blind.triggered = true
            end
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
    end,

    in_pool = function(self)
        if G.deck and #G.deck.cards > G.GAME.all_in_jest.starting_prams.deck_size then
            return (#G.deck.cards - G.GAME.all_in_jest.starting_prams.deck_size) >= 2
        end
    end,
}
return { name = {"Blinds"}, items = {the_evergreen} }