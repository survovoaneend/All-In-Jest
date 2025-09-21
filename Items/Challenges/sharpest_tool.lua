local sharpest_tool = {
    object_type = "Challenge",
    key = 'sharpest_tool',
    unlocked = function(self) 
        if G and G.P_CENTERS and G.P_CENTERS['j_aij_dim_bulb'].discovered == true then
            local joker_amt = 0
            local total_amt = 0
            for k, v in pairs(G.P_CENTER_POOLS['Joker']) do
                if v.rarity == 1 then
                    total_amt = total_amt + 1
                    if v.discovered then
                        joker_amt = joker_amt + 1
                    end
                end
            end
            if joker_amt >= (total_amt/3)*2 then
                return true 
            end
        end
    end,
    jokers = {
        { id = 'j_aij_dim_bulb' },
    },
    rules = {
        custom = {
            {id = 'aij_sharpest_tool_1'},
            {id = 'aij_sharpest_tool_2'},
        },
    },
    restrictions = {
        banned_cards = {
            { id = 'j_aij_pace' },
            { id = 'j_aij_jesters_privelege' },
        },
        banned_tags = {
            {id = 'tag_uncommon'},
            {id = 'tag_rare'},
            {id = 'tag_aij_unusual'},
            {id = 'tag_aij_recherche'},
        },
    },
}
local temp_create_card = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    local card = nil
    if ((area == G.shop_jokers) or (area == G.pack_cards and key_append == 'buf')) and _type == 'Joker' then
        if G.GAME.modifiers.aij_sharpest_tool_1 then
            card = temp_create_card(_type, area, false, 0, skip_materialize, soulable, nil, key_append)
        end
    end
    if not card then
        card = temp_create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    end
    return card
end
return { name = {"Challenges"}, items = {sharpest_tool} }