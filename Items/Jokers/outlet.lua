local outlet = {
    object_type = "Joker",
    order = 463,
    key = "outlet",
    config = {
        extra = {
            
        },
    },
    rarity = 2,
    pos = { x = 6, y = 23 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_aij_charged
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = create_playing_card({
                        front = pseudorandom_element(G.P_CARDS, pseudoseed('outlet')),
                        center = G.P_CENTERS.m_aij_charged}, G.hand, nil, nil, {G.C.SECONDARY_SET.Enhanced})
                    G.GAME.blind:debuff_card(_card)
                    G.hand:sort()
                    playing_card_joker_effects({_card})
                    _card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            return nil, true
        end
    end
}

return { name = { "Jokers" }, items = { outlet } }
