local goblet = {
    object_type = "Joker",
    order = 498,
    key = "goblet",
    
    config = {
        extra = {
            slots = 2
        }
    },
    rarity = 1,
    pos = { x = 10, y = 24 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    add_to_deck = function(self, card, from_debuff)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slots
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.slots
    end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.slots
            }
        }
    end,

    calculate = function(self, card, context)
        
    end
}

return { name = { "Jokers" }, items = { goblet } }
