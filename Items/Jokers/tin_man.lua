local tin_man = {
    object_type = "Joker",
    order = 528,
    key = "tin_man",
    
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 13, y = 25 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_steel
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
        local enhanced_a_card = false
        if  G.hand and G.hand.cards then
            for k, v in ipairs(G.hand.cards) do
                if v:is_suit('Hearts') and v.config.center == G.P_CENTERS.c_base and not v.debuff then
                    v:set_ability(G.P_CENTERS.m_steel, nil, true) 
                    enhanced_a_card = true 
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if v and not v.removed then
                                v:juice_up()
                            end
                            return true
                        end
                    }))
                end
            end
        end
        if enhanced_a_card then
          return {
              message = 'Steel!',
              card = card 
          }
        end
    end
    end
}

return { name = { "Jokers" }, items = { tin_man } }
