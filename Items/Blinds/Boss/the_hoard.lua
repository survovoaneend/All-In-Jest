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
        for k, v in pairs(G.GAME.all_in_jest.advanced_hand_usage_ante) do
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
        add_val = add_val + cur_blind_amt
        G.GAME.blind.chips = add_val
        G.GAME.blind.chip_text = number_format(add_val)
    end,

    disable = function(self)
        local blinds = {}
        for k, v in pairs(G.GAME.all_in_jest.advanced_hand_usage_ante) do
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
            for k, v in pairs(G.GAME.all_in_jest.advanced_hand_usage_ante) do
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