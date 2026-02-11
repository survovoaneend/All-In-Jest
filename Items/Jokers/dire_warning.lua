local dire_warning = {
    object_type = "Joker",
    order = 409,
    key = "dire_warning",
    
    config = {
        extra = {
            xmult = 3,
            active = false
        }
    },
    rarity = 2,
    pos = { x = 16, y = 14 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.active and localize('k_active') or localize('k_inactive')
            }
        }
    end,

    calculate = function(self, card, context)
         if context.joker_main and card.ability.extra.active then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.end_of_round and not context.blueprint and not context.individual and not context.repetition then
            if G.GAME.current_round.hands_left == 0 then
                card.ability.extra.active = true
                return { message = localize('k_active') }
            else
                card.ability.extra.active = false
                return { message = localize('k_reset') }
            end
        end
    end
}

return { name = { "Jokers" }, items = { dire_warning } }
