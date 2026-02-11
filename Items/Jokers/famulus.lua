local famulus = {
    object_type = "Joker",
    order = 595,
    key = "famulus",
  
    config = {
        extra = {
            dollars = 2
        }
    },
    rarity = 1,
    pos = { x = 8, y = 28 },
    atlas = 'joker_atlas',
    cost = 5,
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
         if context.using_consumeable then
            if context.consumeable.ability.set == "Tarot" then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                return {
                    dollars = card.ability.extra.dollars,
                    func = function()
                        G.E_MANAGER:add_event(Event({ func = function() G.GAME.dollar_buffer = 0; return true end }))
                    end
                }
            end
        end
    end
}


return { name = { "Jokers" }, items = { famulus } }