local the_fig = {
    object_type = "Blind",
    key = 'the_fig',
    
    boss = {
        min = 1,
    },
    mult = 2,
    boss_colour = HEX("95718b"),
    atlas = 'blinds',
    pos = { X = 0, y = 82},
    order = 82,
    dollars = 5,

    recalc_debuff = function(self, card, from_blind)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return false
        end
        if card.ability.aij_the_fig_debuff then
            return true
        end
        return false
    end,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return false
        end
        if context.before and context.scoring_hand and not temp then
            for k, v in pairs(context.scoring_hand) do
                if k == 1 or k == #context.scoring_hand then
                    v.ability.aij_the_fig_debuff = true
                    v:set_debuff(true)
                end
            end
        end
    end
}
return { name = {"Blinds"}, items = {the_fig} }