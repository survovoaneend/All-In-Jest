local dark_presence = {
    object_type = "Joker",
    order = 771,
    
    key = "dark_presence",
    config = {
        extra = {
            retriggers = 2
        }
    },
    attributes = { 'face', 'retrigger' },
    rarity = 3,
    pos = { x = 3, y = 35},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.retriggers,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.repetition then
            if context.cardarea == G.hand then
                if context.other_card:is_face() and (next(context.card_effects[1]) or #context.card_effects > 1) then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = card.ability.extra.retriggers,
                        card = card
                    }
                end
            end
        end
    end
}
return { name = {"Jokers"}, items = {dark_presence} }