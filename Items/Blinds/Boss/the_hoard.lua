local the_hoard = {
    object_type = "Blind",
    key = 'the_hoard',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("7a73bb"),
    atlas = 'blinds',
    pos = { X = 0, y = 63},
    order = 40,
    dollars = 5,

    set_blind = function(self)
        local cur_blind_amt = get_blind_amount(G.GAME.round_resets.ante) * G.GAME.blind.mult
        local blinds = {}
        for k, v in pairs(G.all_in_jest.advanced_hand_usage_ante) do
            if v.blind ~= G.GAME.blind then
                local name = v.blind.name
                blinds[name] = blinds[name] or {}
                blinds[name].chips = v.blind.chips
                blinds[name].chip_total = blinds[name].chip_total or 0
                blinds[name].chip_total = blinds[name].chip_total + v.total_chips
            end
        end
        local add_val = 0
        for k, v in pairs(blinds) do
            if v.chip_total > v.chips then
                add_val = add_val + (v.chip_total - v.chips)
            end
        end
        G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    local final_chips = add_val + G.GAME.blind.chips
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
        local blinds = {}
        for k, v in pairs(G.all_in_jest.advanced_hand_usage_ante) do
            if v.blind ~= G.GAME.blind then
                local name = v.blind.name
                blinds[name] = blinds[name] or {}
                blinds[name].chips = v.blind.chips
                blinds[name].chip_total = blinds[name].chip_total or 0
                blinds[name].chip_total = blinds[name].chip_total + v.total_chips
            end
        end
        local add_val = 0
        for k, v in pairs(blinds) do
            if v.chip_total > v.chips then
                add_val = add_val + (v.chip_total - v.chips)
            end
        end
        add_val = G.GAME.blind.chips - add_val 
        G.GAME.blind.chips = add_val
        G.GAME.blind.chip_text = number_format(add_val)
    end,

    defeat = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if not temp then
            local blinds = {}
            for k, v in pairs(G.all_in_jest.advanced_hand_usage_ante) do
                if v.blind ~= G.GAME.blind then
                    local name = v.blind.name
                    blinds[name] = blinds[name] or {}
                    blinds[name].chips = v.blind.chips
                    blinds[name].chip_total = blinds[name].chip_total or 0
                    blinds[name].chip_total = blinds[name].chip_total + v.total_chips
                end
            end
            local add_val = 0
            for k, v in pairs(blinds) do
                if v.chip_total > v.chips then
                    add_val = add_val + (v.chip_total - v.chips)
                end
            end
            add_val = G.GAME.blind.chips - add_val 
            G.GAME.blind.chips = add_val
            G.GAME.blind.chip_text = number_format(add_val)
        end
    end
}
return { name = {"Blinds"}, items = {the_hoard} }