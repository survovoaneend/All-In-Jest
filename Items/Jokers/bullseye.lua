local bullseye = {
    object_type = "Joker",
    order = 477,
    key = "bullseye",
    
    config = {
        extra = {
            xmult = 3
        }
    },
    rarity = 2,
    pos = { x = 18, y = 23 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if to_number(hand_chips) % 10 == 0 then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { bullseye } }
