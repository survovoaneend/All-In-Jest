local blood_artist = {
    object_type = "Joker",
    order = 86,

    key = "blood_artist",
    config = {
        extra = {
            blind_reduction = 10
        }
    },
    rarity = 2,
    pos = { x = 6, y = 3 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.blind_reduction,
            }
        }
    end,

    calculate = function(self, card, context)
        if G.GAME.blind.chips > 0 then
            -- Removing non-playing cards and selling cards
            if context.joker_type_destroyed or context.selling_card then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.blind.chips = G.GAME.blind.chips - math.ceil(G.GAME.blind.chips * (card.ability.extra.blind_reduction * 0.01))
                        G.GAME.blind.chip_text = G.GAME.blind.chips
                        return true
                    end
                }))
            end

            -- Removing playing cards
            if context.remove_playing_cards then
                local destroyed_count = #context.removed
                G.E_MANAGER:add_event(Event({
                    func = function ()
                        G.GAME.blind.chips = G.GAME.blind.chips - math.ceil(G.GAME.blind.chips * (card.ability.extra.blind_reduction * 0.01) * destroyed_count)
                        G.GAME.blind.chip_text = G.GAME.blind.chips
                        return true
                    end
                }))
            end

            -- return nil, true
        end
    end
}

return { name = { "Jokers" }, items = { blood_artist } }
