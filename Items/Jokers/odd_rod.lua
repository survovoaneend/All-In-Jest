local odd_rod = {
    object_type = "Joker",
    order = 754,

    key = "odd_rod",
    config = {

    },
    attributes = {'retrigger', 'rank', 'three', 'ace', 'five', 'seven', 'nine'},
    rarity = 2,
    pos = { x = 10, y = 34},
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
        if context.repetition and context.cardarea == G.play then
            local id = context.other_card:get_id()
            if (id <= 10 and id >= 0 and id % 2 == 1) or (id == 14) then
                return {
                    repetitions = 1
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {odd_rod} }