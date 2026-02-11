local candidate = {
    object_type = "Joker",
    order = 472,
    key = "candidate",
    
    config = {
        extra = {
           mult = 13,
           chips = 50
        }
    },
    rarity = 3,
    pos = { x = 14, y = 23 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.other_joker then
            if context.other_joker.config.center.rarity == 1 then
                return {
                    chips = card.ability.extra.chips,
                }
            end
            if context.other_joker.config.center.rarity == 2 or context.other_joker.config.center.rarity == 3 then
                return {
                    mult = card.ability.extra.mult,
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { candidate } }
