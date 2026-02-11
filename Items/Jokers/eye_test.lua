local eye_test = {
    object_type = "Joker",
    order = 519,
    key = "eye_test",
    config = {
        extra = {
            mult = 5,
            count = 0
        }
    },
    rarity = 1,
    pos = { x = 4, y = 25 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult, 
                card.ability.extra.count * card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        local current_size = 0
        if context.before and not context.blueprint then
            current_size = #context.full_hand
            if G.GAME.jest_last_hand_size and current_size > G.GAME.jest_last_hand_size then
                card.ability.extra.count = card.ability.extra.count + 1
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
            else
                card.ability.extra.count = 0 
            end
        end
        if context.after and not context.blueprint then
            G.GAME.jest_last_hand_size = #context.full_hand
        end
        if context.joker_main and card.ability.extra.count > 0 then
            return {
                mult = card.ability.extra.count * card.ability.extra.mult
            }
        end
    end
}

return { name = { "Jokers" }, items = { eye_test } }
