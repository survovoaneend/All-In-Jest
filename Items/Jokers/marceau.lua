local marceau = {
    object_type = "Joker",
    order = 10025,

    key = "marceau",
    config = {
        extra = {
            repetitions = 2
        }
    },
    attributes = {},
    rarity = 4,
    unlock_condition = { hidden = true },
    pos = { x = 4, y = 18},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 4, y = 19},

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.repetitions
            }
        }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.hand and (next(context.card_effects[1]) or #context.card_effects > 1) then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end

        if context.repetition and (context.cardarea == G.discard or (context.other_context and context.other_context.discard)) then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end

        if context.retrigger_joker_check and not context.retrigger_joker then
            local other_context = context.other_context
            if other_context and (other_context.discard or other_context.pre_discard) then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {marceau} }