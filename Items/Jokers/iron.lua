local iron = {
    object_type = "Joker",
    order = 588.7,

    key = "iron",
    config = {

    },
    attributes = { 'retrigger', 'hand_type' },
    rarity = 2,
    pos = { x = 13, y = 32},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return { }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.scoring_name == "Four of a Kind" then
            return {
                repetitions = 1
            }
        end
    end
}
return { name = {"Jokers"}, items = {iron} }