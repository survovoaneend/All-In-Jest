local mr_catfish = {
    object_type = "Joker",
    order = 282,

    key = "mr_catfish",
    config = {
        extra = {
            dollars = 20,
            discards_remaining = 20,
            discards = 20
        }
    },
    rarity = 2,
    pos = { x = 5, y = 11 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return
        { vars = { card.ability.extra.dollars, card.ability.extra.discards, card.ability.extra.discards_remaining } }
    end,

    calculate = function(self, card, context)
        if context.discard then
            if card.ability.extra.discards_remaining <= 1 then
                card.ability.extra.discards_remaining = card.ability.extra.discards
                return {
                    dollars = card.ability.extra.dollars,
                    func = function()
                        G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.dollar_buffer = 0
                                return true
                            end
                        }))
                    end
                }
            else
                if not context.blueprint then
                    card.ability.extra.discards_remaining = card.ability.extra.discards_remaining - 1
                    return nil, true
                end
            end
        end
    end

}
return { name = { "Jokers" }, items = { mr_catfish } }
