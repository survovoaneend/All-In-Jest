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
    apply = function(self) 
        G.GAME.shop = G.GAME.shop or {}
        G.GAME.shop.slot_details = G.GAME.shop.slot_details or {}
        for i = 1, 2 do
            table.insert(G.GAME.shop.slot_details, 1,{
                ['type'] = nil,
                ['rarity'] = 0,
                ['key'] = nil,
                ['remove_tag'] = 'ch_sharpest_tool'
            })
        end
    end,
}
return { name = {"Challenges"}, items = {sharpest_tool} }