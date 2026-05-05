local psycho = {
    object_type = "Joker",
    order = 525,
    key = "psycho",

    config = {
        extra = {
            xmult_gain = 0.1,
            xmult = 1
        }
    },
    rarity = 3,
    pos = { x = 10, y = 25 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult } }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            
            if my_pos and my_pos > 1 and G.jokers.cards[my_pos - 1] and not SMODS.is_eternal(G.jokers.cards[my_pos - 1], card) and not G.jokers.cards[my_pos - 1].getting_sliced then
                local sliced_card = G.jokers.cards[my_pos - 1]
                sliced_card.getting_sliced = true
                
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        card.ability.extra.xmult = card.ability.extra.xmult + (sliced_card.sell_cost * card.ability.extra.xmult_gain)
                        card:juice_up(0.8, 0.8)
                        
                        sliced_card:start_dissolve({ G.C.RED }, nil, 1.6)
                        play_sound('slice1', 0.96 + math.random() * 0.08)
                        return true
                    end
                }))
                
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult + (sliced_card.sell_cost * card.ability.extra.xmult_gain) } },
                    colour = G.C.XMULT,
                    no_juice = true
                }
            end
        end
        
        if context.joker_main then
            if card.ability.extra.xmult > 1 then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { psycho } }
