local bucolic_hills = {
    object_type = "Joker",
    order = 381,
    key = "bucolic_hills",
   
    config = {
        extra = {
            dollars = 6
        }
    },
    rarity = 1,
    pos = { x = 18, y = 16 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            if G.GAME.current_round.hands_left == 0 then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                return {
                    dollars = card.ability.extra.dollars,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.dollar_buffer = 0
                                return true
                            end
                        }))
                    end
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { bucolic_hills } }
