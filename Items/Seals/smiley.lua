local smiley = {
    object_type = "Seal",
    key = 'smiley',
    config = {
        extra = {
            joker_amt = 1
        },
    },
    atlas = 'enhancements_atlas',
    pos = { x = 7, y = 2 },
    badge_colour = HEX("83b8c0"),
    order = 0,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.seal.extra.joker_amt } }
    end,
    calculate = function(self, card, context)
        if context.remove_playing_cards then
            for i, v in ipairs(context.removed) do
                if v == card then
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                        for _ = 1, card.ability.seal.extra.joker_amt do
                            local jokers = {}
                            for i = 1, #G.jokers.cards do
                                if G.jokers.cards[i].edition == nil then
                                    table.insert(jokers, G.jokers.cards[i])
                                end
                            end
                            local joker = pseudorandom_element(jokers, pseudoseed('smiley'))
                            if joker and #jokers > 0 then
                                local edition = poll_edition('smiley' .. G.GAME.round_resets.ante, 2, false, true)
                                joker:set_edition(edition, true)
                            end
                        end
                    return true end }))
                end
            end
        end
    end
}
return {name = {"Seals"}, items = {smiley}}