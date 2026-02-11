local nihilartikel = {
    object_type = "Joker",
    order = 576,
    key = "nihilartikel",
  
    config = {
        extra = {
          slots = 2,
          cost = 3
        }
    },
    rarity = 3,
    pos = { x = 15, y = 27 },
    atlas = 'joker_atlas',
    cost = 12,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.slots,
                card.ability.extra.cost
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slots
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.slots
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and not context.blueprint then
            ease_dollars(-card.ability.extra.cost)
            return {
                message = localize('$') .. "-" .. card.ability.extra.cost,
                colour = G.C.RED
            }
        end
    end
}


return { name = { "Jokers" }, items = { nihilartikel } }