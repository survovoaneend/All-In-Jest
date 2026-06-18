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
            local enhance = SMODS.poll_enhancement({guaranteed = true, key = 'doormat'})
            play_sound('card1', 0.9 + 0.05, 0.5) 
            cur_card:juice_up(0.2, 0.1)
            cur_card:set_ability(G.P_CENTERS[enhance])
            card:juice_up(0.5, 0.2)
        end
    end
}

return { name = { "Jokers" }, items = { doormat } }
