local bouffon = {
    object_type = "Joker",
    order = 501,
    key = "bouffon",
    config = {
        extra = {
            cards = 5
        }
    },
    rarity = 1,
    pos = { x = 13, y = 24 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    ignore = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cards,
            }
        }
    end,

    calculate = function(self, card, context)
        
    end
}

return { name = { "Jokers" }, items = { bouffon } }
