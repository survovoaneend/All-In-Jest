local spectre = {
    object_type = "Joker",
    order = 148,

    key = "spectre",
    config = {
      
    },
    rarity = 3,
    pos = { x = 17, y = 5 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.end_of_round and context.beat_boss and not context.individual and not context.repetition and not context.blueprint and #G.consumeables.cards > 0 then
            --     for i = 1, #G.consumeables.cards do                     
            --         SMODS.destroy_cards(G.consumeables.cards)
            --         create_consumable('Spectral', nil, nil, nil)
            --         card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral')})
            --     end
            G.E_MANAGER:add_event(Event({
                trigger = 'after', 
                delay = 0.4, 
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true 
                end 
            }))
            for i=1, #G.consumeables.cards do
                local percent = 1.15 - (i-0.999)/(#G.consumeables.cards-0.998)*0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function() 
                        G.consumeables.cards[i]:flip()
                        play_sound('card1', percent)
                        G.consumeables.cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.5)
            for i=1, #G.consumeables.cards do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local original_edition = G.consumeables.cards[i].edition or {}

                        -- Other mods might add stickers to consumables, and its an idea for a tattered deck
                        local original_stickers = {}
                        for k, _ in pairs(G.shared_stickers) do
                            if G.consumeables.cards[i].ability[k] then
                                original_stickers[k] = G.consumeables.cards[i].ability[k]
                                if k == "perishable" then
                                    original_stickers["perish_tally"] = G.consumeables.cards[i].ability.perish_tally or 5
                                end
                            end
                        end
                        G.consumeables.cards[i]:set_edition(nil, true, true)

                        local _pool, _pool_key = get_current_pool("Spectral", nil, nil, "aij_spectre")
                        center = pseudorandom_element(_pool, pseudoseed(_pool_key))
                        local it = 1
                        while center == 'UNAVAILABLE' do
                            it = it + 1
                            center = pseudorandom_element(_pool, pseudoseed(_pool_key..'_resample'..it))
                        end
                        center = G.P_CENTERS[center]

                        G.consumeables.cards[i]:set_ability(center)

                        G.consumeables.cards[i]:set_edition(original_edition, true, true)
                        for k, _ in pairs(G.shared_stickers) do
                            if original_stickers[k] then
                                G.consumeables.cards[i].ability[k] = original_stickers[k]
                            else
                                -- Handle unusual and recherche stickers
                                if type(G.consumeables.cards[i].ability[k]) == "table" and G.consumeables.cards[i].ability[k].mult then
                                    G.consumeables.cards[i].ability[k].mult = tostring(1)
                                    G.consumeables.cards[i]:update(0)
                                end
                                G.consumeables.cards[i].ability[k] = nil
                            end
                        end
                        return true
                    end
                }))
            end
            for i=1, #G.consumeables.cards do
                local percent = 0.85 + (i-0.999)/(#G.consumeables.cards-0.998)*0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.consumeables.cards[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.consumeables.cards[i]:juice_up(0.3, 0.3)
                        return true
                    end 
                }))
            end
            delay(0.5)
        end
    end
  
}
return { name = {"Jokers"}, items = {spectre} }
