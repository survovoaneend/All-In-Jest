function getRandomClayBlindReqs(blind_amt)
    if next(SMODS.find_card("j_aij_fall_of_count_chaligny")) then
        return {number_format(blind_amt)}
    else
        local blind_amts = {}
        local clay_mult = (G.P_BLINDS["bl_aij_the_clay"] or {mult = 2}).mult

        local base_amt = blind_amt / clay_mult

        for m = 2.05, 5, 0.14 do
            table.insert(blind_amts, number_format(base_amt * m))
        end

        -- if blind_amt < 1e99 then
        --     table.insert(blind_amts, number_format(9.9e99))
        -- end
        table.insert(blind_amts, number_format(1/0)) -- gives naneinf

        return blind_amts
    end
end

local the_clay = {
    object_type = "Blind",
    key = 'the_clay',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("95a4a9"),
    atlas = 'blinds',
    pos = { X = 0, y = 39},
    order = 18,
    dollars = 5,

    set_blind = function(self)
        local new_mod = pseudorandom("clay", 2, 4) + math.floor(100*pseudorandom("clay"))/100 -- Randomises an integer part (1-4) and a decimal part (0.00 to 0.99) before adding both together
        All_in_Jest.ease_blind_requirement(new_mod - 1, 0)
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
    end

}
-- code in aureate coin
return { name = {"Blinds"}, items = {the_clay} }
