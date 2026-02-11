local diamantaire = {
    object_type = "Joker",
    order = 574,
    key = "diamantaire",
  
    config = {
        extra = {
            dollars = 3
        }
    },
    rarity = 2,
    pos = { x = 13, y = 27 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)
         if context.before and G.GAME.current_round.hands_played == 0 and not context.blueprint then
            if #context.full_hand == 1 and context.full_hand[1]:is_suit('Diamonds') then
                context.full_hand[1]:set_ability('m_gold')
                context.full_hand[1]:juice_up()
                
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


return { name = { "Jokers" }, items = { diamantaire } }