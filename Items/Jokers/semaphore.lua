local semaphore = {
    object_type = "Joker",
    order = 509,
    key = "semaphore",

    config = {
        extra = {
            mult = 1
        }
    },
    rarity = 2,
    pos = { x = 19, y = 24 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            return {
                mult = card.ability.extra.mult * G.GAME.current_round.discards_left
            }
        end
    end
}

return { name = { "Jokers" }, items = { semaphore } }
