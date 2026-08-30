local the_seed = {
    object_type = "Blind",
    key = 'the_seed',
    
    boss = {
        min = 1,
    },
    mult = 2,
    boss_colour = HEX("d4ccbc"),
    atlas = 'blinds',
    pos = { X = 0, y = 85},
    order = 85,
    dollars = 5,

    defeat = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        G.GAME.aij_has_big_boss = true
        G.GAME.aij_big_boss_reset_ante = true
        G.GAME.round_resets.blind_choices.Big_Boss = get_new_boss()
    end
}

local aij_smods_get_new_blind_ref = SMODS.get_new_blind
function SMODS.get_new_blind(blind_type)
    if blind_type == "Big_Boss" then
       blind_type = "Boss"
    end
    return aij_smods_get_new_blind_ref(blind_type)
end


return { name = {"Blinds"}, items = {the_seed} }