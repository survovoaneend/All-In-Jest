local sparky = {
    object_type = "Joker",
    order = 484,
    ignore = true,
    key = "sparky",
    config = {
        extra = {
            
        }
    },
    attributes = {},
    rarity = 2,
    pos = { x = 7, y = 23 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    in_pool = function(self, args)
        if G.deck then
            if #G.deck.cards > 0 then
                for i = 1, #G.deck.cards do
                    if G.deck.cards[i].config.center == G.P_CENTERS["m_aij_charged"] then
                        return true
                    end
                end
            end
        end
        return false
    end,
}

return { name = { "Jokers" }, items = { sparky } }
