local calculate_lexicon_mult = function(card)
    local mult = 0
    if G.jokers then
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] ~= card and G.jokers.cards[i].config.center.key ~= 'j_aij_lexicon' then
                local text = retrieve_joker_text(G.jokers.cards[i])
 
                -- Consecutive spaces usually indicates some sort of missing dynatext
                if string.match(text, "  ") then
                    local other_vars, _, _ = G.jokers.cards[i]:generate_UIBox_ability_table(true)
                    G.jokers.cards[i].ability_UIBox_table = generate_card_ui(G.jokers.cards[i].config.center, nil, other_vars)
                    text = retrieve_joker_text(G.jokers.cards[i])
                end

                local new_mult = 0 -- For dynatext check

                -- If you want to sum each digit instead, use following regex: "%d"
                local number_regex = "%d"
                for num in string.gmatch(text, number_regex) do
                    new_mult = new_mult + tonumber(num)
                end

                -- Dynatext comes up as nothing in some situations
                -- To mitigate this, try again once while forcing UIBox to (re)generate
                if new_mult == 0 then
                    local other_vars, _, _ = G.jokers.cards[i]:generate_UIBox_ability_table(true)
                    G.jokers.cards[i].ability_UIBox_table = generate_card_ui(G.jokers.cards[i].config.center, nil, other_vars)
                    text = retrieve_joker_text(G.jokers.cards[i])
                    for num in string.gmatch(text, number_regex) do
                        new_mult = new_mult + tonumber(num)
                    end
                end

                mult = mult + new_mult
            end
        end
    end

    return mult
end

local lexicon = {
    object_type = "Joker",
    order = 322,
    key = "lexicon",
    config = {},
    rarity = 1,
    pos = { x = 18, y = 12},
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local mult = calculate_lexicon_mult(card)
        return { 
            vars = {mult}
        }
    end,
  
    calculate = function(self, card, context)
        if context.joker_main and G.jokers then
            local mult = calculate_lexicon_mult(card)
            if mult ~= 0 then
                return {
                    mult = mult
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {lexicon} }
