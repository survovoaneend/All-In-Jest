local office_assistant = {
    object_type = "Joker",
    order = 415,
    key = "office_assistant",
    config = {
    },
    rarity = 2,
    pos = { x = 2, y = 20},
    soul_pos = { x = 3, y = 20},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    all_in_jest = {
        ability_cost = function(self, card)
            local right_card = nil
            if G.jokers then
                for k, v in pairs(G.jokers.cards) do
                    if v == card and G.jokers.cards[k+1] then
                        right_card = G.jokers.cards[k+1]
                    end
                end
            end
            if right_card then
                if right_card.ability.rental and right_card.ability.perishable and to_big(G.GAME.dollars) >= to_big(right_card.config.center.cost) then
                    return right_card.config.center.cost
                elseif right_card.ability.rental and right_card.ability.perishable and (right_card.ability.perish_tally < G.GAME.perishable_rounds or 5) then
                    return 3
                elseif right_card.ability.rental then
                    return right_card.config.center.cost
                elseif right_card.ability.perishable and (right_card.ability.perish_tally < G.GAME.perishable_rounds or 5) then
                    return 3
                end
            end
        end,

        can_use_ability = function(self, card, context)
            local viable_options = {}
            for k, v in pairs(G.jokers.cards) do
                if v == card and G.jokers.cards[k+1] and G.jokers.cards[k+1].ability then
                    if ((G.jokers.cards[k+1].ability.perishable and to_big(G.GAME.dollars) >= to_big(3) and G.jokers.cards[k+1].ability.perish_tally < (G.GAME.perishable_rounds or 5)) or (G.jokers.cards[k+1].ability.rental and to_big(G.GAME.dollars) >= to_big(G.jokers.cards[k+1].config.center.cost))) then
                        viable_options[#viable_options+1] = k+1
                    end
                end
            end
            if #viable_options > 0 then
                return true
            end
        end,

        use_ability = function(self, card)
            local right_card = nil
            for k, v in pairs(G.jokers.cards) do
                if v == card and G.jokers.cards[k+1] then
                    right_card = G.jokers.cards[k+1]
                end
            end
            if right_card.ability.rental and to_big(G.GAME.dollars) >= to_big(right_card.config.center.cost) then
                ease_dollars(-right_card.config.center.cost)
                card_eval_status_text(card, 'dollars', -right_card.config.center.cost)
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        right_card:juice_up(0.3, 0.5)
                        right_card:remove_sticker('rental')
                        return true
                    end)
                }))
                card_eval_status_text(right_card, 'extra', nil, nil, nil, {message = localize('aij_paid_off')..'!'})
            elseif right_card.ability.perishable and to_big(G.GAME.dollars) >= to_big(3) then
                ease_dollars(-3)
                card_eval_status_text(card, 'dollars', -3)
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        right_card:juice_up(0.3, 0.5)
                        right_card.ability.perish_tally = G.GAME.perishable_rounds or 5
                        right_card:set_debuff()
                        return true
                    end)
                }))
                card_eval_status_text(right_card, 'extra', nil, nil, nil, {message = localize('aij_refreshed')..'!'})
            end
        end,
    },

    update = function(self, card, dt)
        if not card.aij_ability_cost_label or card.config.center.all_in_jest:ability_cost(card) ~= card.aij_ability_cost_label then
            card.aij_ability_cost_label = card.config.center.all_in_jest:ability_cost(card) or "??"
        end
    end,

    in_pool = function(self, args)
        for k, v in pairs(G.jokers.cards) do
            if v and v.ability then
                if v.ability.perishable or v.ability.rental then
                    return true
                end
            end
        end
        return false
    end,
  
    loc_vars = function(self, info_queue, card)
		    info_queue[#info_queue + 1] = { set = 'Other', key = 'office_assistant_perishable' }
        info_queue[#info_queue + 1] = { set = 'Other', key = 'office_assistant_rental' }
        return {
            vars = {
                colours = { 
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,
  
    calculate = function(self, card, context)
		
    end,
}
return { name = {"Jokers"}, items = {office_assistant} }