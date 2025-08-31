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
        can_use_ability = function(self, card, context)
            local viable_options = {}
            for k, v in pairs(G.jokers.cards) do
                if v == card and G.jokers.cards[k+1] and G.jokers.cards[k+1].ability then
                    if ((G.jokers.cards[k+1].ability.perishable and to_big(G.GAME.dollars) >= to_big(3)) or (G.jokers.cards[k+1].ability.rental and to_big(G.GAME.dollars) >= to_big(G.jokers.cards[k+1].config.center.cost))) then
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
                right_card:remove_sticker('rental')
                right_card:juice_up(0.3, 0.5)
                card_eval_status_text(right_card, 'extra', nil, nil, nil, {message = localize('aij_paid_off')..'!'})
            elseif right_card.ability.perishable and to_big(G.GAME.dollars) >= to_big(3) then
                ease_dollars(-3)
                card_eval_status_text(card, 'dollars', -3)
                right_card.ability.perish_tally = G.GAME.perishable_rounds or 5
                right_card:juice_up(0.3, 0.5)
                card_eval_status_text(right_card, 'extra', nil, nil, nil, {message = localize('aij_refreshed')..'!'})
            end
        end,
    },

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
    end,
  
    calculate = function(self, card, context)
		
    end,
}
return { name = {"Jokers"}, items = {office_assistant} }