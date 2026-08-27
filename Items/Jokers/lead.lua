local lead = {
    object_type = "Joker",
    order = 585.4,

    key = "lead",
    config = {

    },
    attributes = { 'retrigger', 'hand_type' },
    rarity = 2,
    pos = { x = 19, y = 32},
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return { }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.scoring_name == "Straight" then
            return {
                repetitions = 1
            }
        end
    end
}
return { name = {"Jokers"}, items = {lead} }