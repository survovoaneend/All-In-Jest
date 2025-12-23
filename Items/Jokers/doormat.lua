local doormat = {
    object_type = "Joker",
    order = 531,
    key = "doormat",
    config = {
        extra = {
            
        }
    },
    rarity = 1,
    pos = { x = 16, y = 25 },
    atlas = 'joker_atlas',
    cost = 4,
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

    calculate = function(self, card, context)
        if context.first_hand_drawn and #SMODS.drawn_cards > 0 then
            local cur_card = SMODS.drawn_cards[1]
            local cen_pool = {}
            for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                if v.key ~= 'm_stone' and v.key ~= 'm_aij_canvas' then 
                    cen_pool[#cen_pool+1] = v
                end
            end
            center = pseudorandom_element(cen_pool, pseudoseed('doormat'))
            play_sound('card1', 0.9 + 0.05, 0.5) 
            cur_card:juice_up(0.2, 0.1)
            cur_card:set_ability(center)
            card:juice_up(0.5, 0.2)
        end
    end
}

return { name = { "Jokers" }, items = { doormat } }
