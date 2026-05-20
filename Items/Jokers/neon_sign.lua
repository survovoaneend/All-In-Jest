local neon_sign = {
    object_type = "Joker",
    order = 464,
    key = "neon_sign",
    
    config = {
        extra = {
            full_house_last_hand = false,
            xmult = 3

        }
    },
    rarity = 2,
    pos = { x = 6, y = 21 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.full_house_last_hand and localize('k_inactive') or localize('k_active')
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands['Full House']) then
            if not card.ability.extra.full_house_last_hand then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
        if context.after and not context.blueprint then
            if next(context.poker_hands['Full House']) then
                card.ability.extra.full_house_last_hand = true
            else
                card.ability.extra.full_house_last_hand = false
            end
        end
    end
}

return { name = { "Jokers" }, items = { neon_sign } }
