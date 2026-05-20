local calculate_crayon_rubbing_chips = function(card)
    local chips = 0
    if G.jokers then
        local right_joker = nil
        for i = 1, #G.jokers.cards do
            local other_card = G.jokers.cards[i]
            if other_card == card and G.jokers.cards[i+1] then
                right_joker = G.jokers.cards[i+1]
            end
        end
        if right_joker then
            if right_joker ~= card and right_joker.config.center.key ~= 'j_aij_crayon_rubbing' then
                local text = retrieve_joker_text(right_joker)
 
                -- Consecutive spaces usually indicates some sort of missing dynatext
                if string.match(text, "  ") then
                    local other_vars, _, _ = right_joker:generate_UIBox_ability_table(true)
                    right_joker.ability_UIBox_table = generate_card_ui(right_joker.config.center, nil, other_vars)
                    text = retrieve_joker_text(right_joker)
                end

                local new_chips = 0 -- For dynatext check

                -- If you want to sum each digit instead, use following regex: "%d"
                local number_regex = "%d+"
                for num in string.gmatch(text, number_regex) do
                    new_chips = new_chips + tonumber(num)
                end

                -- Dynatext comes up as nothing in some situations
                -- To mitigate this, try again once while forcing UIBox to (re)generate
                if new_chips == 0 then
                    local other_vars, _, _ = right_joker:generate_UIBox_ability_table(true)
                    right_joker.ability_UIBox_table = generate_card_ui(right_joker.config.center, nil, other_vars)
                    text = retrieve_joker_text(right_joker)
                    for num in string.gmatch(text, number_regex) do
                        new_chips = new_chips + tonumber(num)
                    end
                end

                chips = chips + new_chips
            end
        end
    end

    return math.floor(chips)
end

local crayon_rubbing = {
    object_type = "Joker",
    order = 529,
    key = "crayon_rubbing",
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 14, y = 25 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local chips = calculate_crayon_rubbing_chips(card)
        return { 
            vars = {chips}
        }
    end,
  
    calculate = function(self, card, context)
        if context.joker_main and G.jokers then
            local chips = calculate_crayon_rubbing_chips(card)
            if chips ~= 0 then
                return {
                    chips = chips
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { crayon_rubbing } }
