local meaty_joker = {
    object_type = "Joker",
    order = 449,
    key = "meaty_joker",

    config = {
        extra = {
            xmult = 1,
            cards = 25
        }
    },
    rarity = 3,
    pos = { x = 18, y = 22 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local xmult = 1
        if G.playing_cards then
            xmult = math.floor(#G.playing_cards/card.ability.extra.cards)
        end
        if xmult < 1 then
            xmult = 1
        end
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.cards,
                xmult
            }
        }
    end,

    calculate = function(self, card, context)
        local xmult = math.floor(#G.playing_cards/card.ability.extra.cards)
        if xmult < 1 then
            xmult = 1
        end
        if context.joker_main then
            return {
                xmult = xmult
            }
        end
    end
}

return { name = { "Jokers" }, items = { meaty_joker } }
