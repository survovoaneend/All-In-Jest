local gloaming = {
    object_type = "Joker",
    order = 581,
    key = "gloaming",
   
    config = {
        extra = {
            xmult = 1.5
        }
    },
    rarity = 3,
    pos = { x = 18, y = 27 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and G.GAME.current_round.hands_left == 0 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}

return { name = { "Jokers" }, items = { gloaming } }
