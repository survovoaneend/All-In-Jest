local histrio = {
    object_type = "Joker",
    order = 223,

    key = "histrio",
    config = {
        extra = {
            money = 2
        }
    },
    rarity = 2,
    pos = { x = 12, y = 8 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        if not G.GAME.modifiers.money_per_hand then
            G.GAME.modifiers.money_per_hand = 1
        end

        G.GAME.modifiers.money_per_hand = G.GAME.modifiers.money_per_hand + card.ability.extra.money
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.modifiers.money_per_hand = G.GAME.modifiers.money_per_hand - card.ability.extra.money
    end,

    calculate = function(self, card, context)

    end

}
return { name = { "Jokers" }, items = { histrio } }
