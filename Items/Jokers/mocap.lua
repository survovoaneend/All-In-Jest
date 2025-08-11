local mocap = {
    object_type = "Joker",
    order = 289,
    key = "mocap",
    config = {
      
    },
    rarity = 2,
    pos = { x = 12, y = 11},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.selling_card then 
            if context.card ~= card then
                if context.card.ability.set == "Joker" then
                    local rarity = context.card.config.center.rarity
                    if rarity == 4 then
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.2,
                            func = function()
                              local temp_card = create_card('Joker', G.jokers, nil, 1, nil, nil, nil, 'mocap')
                              temp_card:start_materialize()
                              G.jokers:emplace(temp_card)
                              return true
                            end
                        }))
                    elseif rarity == 3 then
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.2,
                            func = function()
                              local temp_card = create_card('Joker', G.jokers, nil, 0.9, nil, nil, nil, 'mocap')
                              temp_card:start_materialize()
                              G.jokers:emplace(temp_card)
                              return true
                            end
                        }))
                    elseif rarity == 2 then
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.2,
                            func = function()
                              local temp_card = create_card('Joker', G.jokers, nil, 0.6, nil, nil, nil, 'mocap')
                              temp_card:start_materialize()
                              G.jokers:emplace(temp_card)
                              return true
                            end
                        }))
                    else
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_nope_ex'), colour = G.C.SECONDARY_SET.Tarot})
                    end
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {mocap} }
