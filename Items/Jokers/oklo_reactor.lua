local oklo_reactor = {
    object_type = "Joker",
    order = 549,
    key = "oklo_reactor",
    
    config = {
        extra = {
           retriggers = 2 
        }
    },
    rarity = 2,
    pos = { x = 3, y = 22 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    enhancement_gate = 'm_gold',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.retriggers
            }
        }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_gold') then
                return {
                    repetitions = card.ability.extra.retriggers,
                }
            end
        end
    end,
}

return { name = { "Jokers" }, items = { oklo_reactor } }
