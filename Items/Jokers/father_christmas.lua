local father_christmas = {
    object_type = "Joker",
    order = 567,
    key = "father_christmas",
    
    config = {
        extra = {
            dollars = 1
        }
    },
    rarity = 3,
    pos = { x = 5, y = 27 },
    atlas = 'joker_atlas',
    cost = 10,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function()
                    G.E_MANAGER:add_event(Event({ func = function() G.GAME.dollar_buffer = 0; return true end }))
                end
            }
        end
    end
}

return { name = { "Jokers" }, items = { father_christmas } }
