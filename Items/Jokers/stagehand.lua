local stagehand = {
    object_type = "Joker",
    order = 290,

    key = "stagehand",
    config = {
        extra = {
            xmult = 0.1
        }
    },
    rarity = 1,
    pos = { x = 13, y = 11 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                1 + card.ability.extra.xmult * (G.jokers and #G.jokers.cards or 0)
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = 1 + card.ability.extra.xmult * #G.jokers.cards
            }
        end
    end

}
return { name = { "Jokers" }, items = { stagehand } }
