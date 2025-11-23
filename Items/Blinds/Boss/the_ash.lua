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
            extra_mult = (G.GAME.all_in_jest.starting_prams.deck_size - #G.deck.cards) * 0.20
        end
        local amt = G.GAME.blind.mult
        G.GAME.blind.mult = G.GAME.blind.mult + extra_mult
        G.GAME.blind.chips = G.GAME.blind.chips/amt
         G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    local final_chips = G.GAME.blind.chips * G.GAME.blind.mult
                    local chip_mod -- iterate over ~120 ticks
                    if type(G.GAME.blind.chips) ~= 'table' then
                        chip_mod = math.ceil((final_chips - G.GAME.blind.chips) / 120)
                    else
                        chip_mod = ((final_chips - G.GAME.blind.chips) / 120):ceil()
                    end
                    local step = 0
                    if G.GAME.chips < G.GAME.blind.chips then
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            blocking = true,
                            func = function()
                                G.GAME.blind.chips = G.GAME.blind.chips + G.SETTINGS.GAMESPEED * chip_mod
                                if G.GAME.blind.chips < final_chips then
                                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                                    if step % 5 == 0 then
                                        play_sound('chips1', 0.8 + (step * 0.005))
                                    end
                                    step = step + 1
                                else
                                    G.GAME.blind.chips = final_chips
                                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                                    G.GAME.blind:wiggle()
                                    return true
                                end
                            end
                        }))
                        return true
                    end
                    return true
                end
            }))
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
        if G.deck and #G.deck.cards < G.GAME.all_in_jest.starting_prams.deck_size then
            return true
        end
    end,
}
return { name = {"Blinds"}, items = {the_ash} }