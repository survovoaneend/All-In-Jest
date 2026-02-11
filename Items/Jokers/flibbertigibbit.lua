local flibbertigibbit = {
    object_type = "Joker",
    order = 597,
    key = "flibbertigibbit",
  
    config = {
        extra = {
            dollars = 1
        }
    },
    rarity = 1,
    pos = { x = 10, y = 28 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,


    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)
        if context.pre_discard then
            local suits = {}
            for _, v in ipairs(context.full_hand) do
                suits[v.base.suit] = true
            end
            
            local unique = 0
            for k, v in pairs(suits) do unique = unique + 1 end
            
            if unique > 0 then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + (unique * card.ability.extra.dollars)
                return {
                    dollars = unique * card.ability.extra.dollars,
                    func = function()
                        G.E_MANAGER:add_event(Event({ func = function() G.GAME.dollar_buffer = 0; return true end }))
                    end
                }
            end
        end
    end
}


return { name = { "Jokers" }, items = { flibbertigibbit } }