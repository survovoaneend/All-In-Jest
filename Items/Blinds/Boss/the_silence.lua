local calculate_repetitions_ref = SMODS.calculate_repetitions
function SMODS.calculate_repetitions(card, context, reps) 
    if G.GAME.blind.config.blind.key == 'bl_aij_the_silence' and context.cardarea == G.play and (card.config.center.set == 'Default' or card.config.center.set == 'Base' or card.config.center.set == 'Enhanced') then
        return reps
    end
    return calculate_repetitions_ref(card, context, reps)
end
local calculate_retriggers_ref = SMODS.calculate_retriggers
function SMODS.calculate_retriggers(card, context, _ret)
    if G.GAME.blind.config.blind.key == 'bl_aij_the_silence' and context.cardarea == G.play and (card.config.center.set == 'Default' or card.config.center.set == 'Base' or card.config.center.set == 'Enhanced') then
        return {}
    end
    return calculate_retriggers_ref(card, context, _ret)
end
local the_silence = {
    object_type = "Blind",
    key = 'the_silence',
    
    boss = {
        min = 4,
    },
    mult = 2,
    boss_colour = HEX("5a537e"),
    atlas = 'blinds',
    pos = { X = 0, y = 73},
    order = 74,
    dollars = 5,
}
return { name = {"Blinds"}, items = {the_silence} }