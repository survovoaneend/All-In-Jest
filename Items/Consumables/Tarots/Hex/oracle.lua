local oracle = {
    object_type = "Consumable",
    key = 'oracle',
    set = 'Tarot',
    pos = { x = 4, y = 8 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_tarot_hex'), HEX('4f6367'), G.C.WHITE, 1.2)
    end,
    cost = 6,
    unlocked = true,
    discovered = false,
    hidden = true,
    soul_rate = 0.01,
    soul_set = 'Tarot',
    order = 505,
    config = { },
    atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
       
    end,
    can_use = function(self, card)
        if G.hand and G.hand.cards and #G.hand.cards > 0 then
            return true 
        end
    end,
    use = function(self, card)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        for i=1, #G.hand.cards do
            local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.2)
        local cen_pool = {}
        for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
            if v.key ~= 'm_stone' then 
                cen_pool[#cen_pool+1] = v
            end
        end
        for k, v in ipairs(G.hand.cards) do
            local enhance = pseudorandom_element(cen_pool, pseudoseed('oracle'..G.GAME.round_resets.ante)).key
            G.E_MANAGER:add_event(Event({func = function()
                v:set_ability(G.P_CENTERS[enhance])
            return true end }))
        end
        for i=1, #G.hand.cards do
            local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.5)
    end,
}
return { name = { "Tarots" }, items = { oracle } }
