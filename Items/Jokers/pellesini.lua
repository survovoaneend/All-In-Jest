local pellesini = {
    object_type = "Joker",
    order = 1007,

    key = "pellesini",
    config = {
      
    },
    rarity = 4,
	  unlock_condition = {hidden = true},
    pos = { x = 6, y = 0},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    soul_pos = { x = 6, y = 1},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.joker_type_destroyed then
            local other_card = context.card
            if other_card.ability.set == "Joker" then
                if ((#G.jokers.cards + G.GAME.joker_buffer) <= G.jokers.config.card_limit or (context.card.edition ~= nil and context.card.edition.negative)) then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local juiced_card = context.blueprint_card or card
                    G.E_MANAGER:add_event(Event({func = function()
                        local temp_card = copy_card(other_card, nil, nil, nil, false)
                        temp_card:add_to_deck()
                        G.jokers:emplace(temp_card)
                        temp_card:start_materialize()
                        if juiced_card == other_card then
                            temp_card:juice_up(0.6, 0.1)
                        else
                            juiced_card:juice_up(0.6, 0.1)
                        end
                        G.GAME.joker_buffer = 0
                        return true
                    end }))
                end
                return nil, true
            end
        end
    end
  
}

return { name = {"Jokers"}, items = {pellesini} }
