
SMODS.ConsumableType({
    key = 'aij_hex_tarot',
    primary_colour = HEX("4f6367"),
    secondary_colour = G.C.SECONDARY_SET.Tarot,
    no_collection = true,
    collection_rows = {5},
    shop_rate = 0,
    default = 'c_aij_error',
    no_buy_and_use = false,
})

local aij_SMODS_collection_pool_ref = SMODS.collection_pool
SMODS.collection_pool = function(_base_pool)

    local pool = aij_SMODS_collection_pool_ref(_base_pool)

    if _base_pool == G.P_CENTER_POOLS.Tarot then
        for _, v in ipairs(G.P_CENTER_POOLS.aij_hex_tarot) do
            if v.discovered then
                table.insert(pool, v)
            end
        end
    end

    return pool
end