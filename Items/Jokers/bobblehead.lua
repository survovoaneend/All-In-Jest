local bobblehead = {
    object_type = "Joker",
    order = 78,

    key = "bobblehead",
    config = {
    },
    rarity = 2,
    pos = { x = 23, y = 2 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local vanilla_rarity_keys = {'common', 'uncommon', 'rare', 'legendary'}
        local rarity_counts = {}
        local max_count = 0
        for k, v in pairs(G.jokers.cards) do
            if v.config.center.rarity and v.config.center.key ~= 'j_aij_bobblehead' then
                local rarity = vanilla_rarity_keys[v.config.center.rarity] or v.config.center.rarity
                rarity_counts[rarity] = (rarity_counts[rarity] or 0) + 1
                if rarity_counts[rarity] > max_count then
                    max_count = rarity_counts[rarity]
                end
            end
        end

        local rarities_label = ''
        for k, v in pairs(rarity_counts) do
            if v >= max_count then
                if rarities_label ~= '' then
                    rarities_label = rarities_label .. ", "
                end
                rarities_label = rarities_label .. localize('k_' .. k)
            end
        end
        if rarities_label == '' then
            rarities_label = localize('k_none')
        end
        return {
            vars = {
                rarities_label,
            }
        }
    end,
}

local aij_smods_poll_rarity_ref = SMODS.poll_rarity
function SMODS.poll_rarity(_pool_key, _rand_key)

    local vanilla_rarity_keys = {'common', 'uncommon', 'rare', 'legendary'}
    local rarity_counts = {}
    local max_count = 0

    if G.jokers and #G.jokers.cards >= 1 and G.GAME then
        if next(SMODS.find_card("j_aij_bobblehead")) then
            for k, v in pairs(G.jokers.cards) do
                if v.config.center.rarity and v.config.center.key ~= 'j_aij_bobblehead' then
                    local rarity = vanilla_rarity_keys[v.config.center.rarity] or v.config.center.rarity
                    rarity_counts[rarity] = (rarity_counts[rarity] or 0) + 1
                    if rarity_counts[rarity] > max_count then
                        max_count = rarity_counts[rarity]
                    end
                end
            end

            for rarity, count in pairs(rarity_counts) do
                local mod_key = rarity:lower()
                if G.GAME[mod_key.. "_mod"] and count >= max_count then
                    G.GAME[mod_key.. "_mod"] = (G.GAME[mod_key.. "_mod"] or 0) + #SMODS.find_card("j_aij_bobblehead") * (rarity ~= "legendary" and 2 or 1)
                end
            end
        end
    end

    local ret = aij_smods_poll_rarity_ref(_pool_key, _rand_key)
    
    if G.jokers and #G.jokers.cards >= 1 and G.GAME then
        if next(SMODS.find_card("j_aij_bobblehead")) then
            for rarity, count in pairs(rarity_counts) do
                local mod_key = rarity:lower()
                if G.GAME[mod_key.. "_mod"] and count >= max_count then
                    G.GAME[mod_key.. "_mod"] = (G.GAME[mod_key.. "_mod"] or 0) - #SMODS.find_card("j_aij_bobblehead") * (rarity ~= "legendary" and 2 or 1)
                end
            end
        end
    end

    return ret
end

return { name = {"Jokers"}, items = {bobblehead} }
