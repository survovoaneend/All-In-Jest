local psycho = {
    object_type = "Joker",
    order = 544,
    key = "psycho",

    config = {
        extra = {
            xmult_gain = 0.1,
            xmult = 1
        }
    },
    attributes = { 'activated', 'xmult', 'scaling', 'sell_value', 'destroy_card', 'position' },
    rarity = 3,
    pos = { x = 10, y = 25 },
    atlas = 'joker_atlas',
    cost = 8,
    lite = true,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.xmult,
                colours = { 
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,

    all_in_jest = {
        can_use_ability = function(self, card, context)
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            local sliced_card = G.jokers.cards[my_pos - 1]
            if sliced_card and not SMODS.is_eternal(sliced_card, card) then
                return true
            end
            return false
        end,

        use_ability = function(self, card, args)
            args = args or {}
            if args.retriggered then return end
            SMODS.calculate_context({all_in_jest = {joker_ability_used = true, card = card, retriggered = args.retriggered, args = args}})
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            local sliced_card = G.jokers.cards[my_pos - 1]
            sliced_card.getting_sliced = true
            
            G.GAME.joker_buffer = G.GAME.joker_buffer - 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.joker_buffer = 0
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "xmult",
                        scalar_value = "xmult_gain",
                        operation = function(ref_table, ref_value, initial, change)
                            ref_table[ref_value] = initial + change * sliced_card.sell_cost
                        end,
                        message_key = 'a_xmult',
                        message_colour = G.C.MULT
                    })
                    card:juice_up(0.8, 0.8)
                    
                    sliced_card:start_dissolve({ G.C.RED }, nil, 1.6)
                    play_sound('slice1', 0.96 + math.random() * 0.08)
                    return true
                end
            }))
        end,
    },

    calculate = function(self, card, context)
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
