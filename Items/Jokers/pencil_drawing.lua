local pencil_drawing = {
    object_type = "Joker",
    order = 63,

    key = "pencil_drawing",
    config = {
        extra = {
            cost = 2
        }
    },
    rarity = 2,
    pos = { x = 9, y = 2 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    all_in_jest = {
        ability_cost = function(self, card)
             return card.ability.extra.cost
        end,
        
        can_use_ability = function(self, card, context)
            if to_big(G.GAME.dollars) >= to_big(card.ability.extra.cost) and G.STATE == G.STATES.SELECTING_HAND then
                return true
            end
        end,

        use_ability = function(self, card)
            ease_dollars(-card.ability.extra.cost)
            card_eval_status_text(card, 'dollars', -card.ability.extra.cost)
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = create_playing_card({
                        front = pseudorandom_element(G.P_CARDS, pseudoseed('pencil_drawing_fr')),
                        center = G.P_CENTERS.c_base}, G.hand, nil, nil, {G.C.SECONDARY_SET.Enhanced})
                    G.GAME.blind:debuff_card(_card)
                    G.hand:sort()
                    playing_card_joker_effects({_card})
                    _card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end,
    },

    update = function(self, card, dt)
        if not card.aij_ability_cost_label or card.config.center.all_in_jest:ability_cost(card) ~= card.aij_ability_cost_label then
            card.aij_ability_cost_label = card.config.center.all_in_jest:ability_cost(card) or 0
        end
    end,
  
    loc_vars = function(self, info_queue, card) 
        return {
            vars = {
                card.ability.extra.cost,
                colours = { 
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {pencil_drawing} }
