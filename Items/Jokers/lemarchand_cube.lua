local lemarchand_cube = {
    object_type = "Joker",
    order = 345,

    key = "lemarchand_cube",
    config = {
        extra = {
            tarots_used = 0,
            tarots_total = 5
        }
    },
    rarity = 2,
    pos = { x = 16, y = 13 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.tarots_used,
                card.ability.extra.tarots_total
            }
        }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable then
            if context.consumeable.ability.set == "Tarot" then
                if not context.blueprint then
                    card.ability.extra.tarots_used = card.ability.extra.tarots_used + 1
                end
                if card.ability.extra.tarots_used >= card.ability.extra.tarots_total then
                    card.ability.extra.tarots_used = 0
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        create_consumable("Spectral", nil, nil, nil)
                        return {
                            message = localize('k_plus_spectral'),
                            colour = G.C.SECONDARY_SET.Spectral,
                        }
                    end
                else
                    if not context.blueprint then
                        return {
                            message = card.ability.extra.tarots_used .. "/" .. card.ability.extra.tarots_total
                        }
                    end
                end
            end
        end
    end

}
return { name = { "Jokers" }, items = { lemarchand_cube } }
