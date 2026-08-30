local pencil_drawing = {
    object_type = "Joker",
    order = 66,

    key = "pencil_drawing",
    config = {
        extra = {
            cost = 2,
            amount = 1,
            rank = 'Ace',
            suit = 'Spades'
        }
    },
    attributes = { 'activated', 'generation', 'playing_card' },
    rarity = 2,
    pos = { x = 9, y = 2 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    all_in_jest = {
        ability_cost = function(self, card)
             return card.ability.extra.cost
        end,
        
        can_use_ability = function(self, card, context)
            if (G.GAME.dollars - G.GAME.bankrupt_at) >= card.ability.extra.cost and G.STATE == G.STATES.SELECTING_HAND then
                return true
            end
        end,

        use_ability = function(self, card, args)
            args = args or {}
            SMODS.calculate_context({all_in_jest = {joker_ability_used = true, card = card, retriggered = args.retriggered, args = args}})
            if not args.free then
                ease_dollars(-card.ability.extra.cost)
                card_eval_status_text(card, 'dollars', -card.ability.extra.cost)
            end
            G.E_MANAGER:add_event(Event({
                func = function()
                    local added = {}
                    for i = 1, card.ability.extra.amount do
                        local _card = SMODS.add_card{
                            set = 'Base', area = G.hand,
                            rank = card.ability.extra.rank,
                            suit = card.ability.extra.suit,
                        }
                        G.GAME.blind:debuff_card(_card)
                        G.hand:sort()
                        _card:juice_up(0.3, 0.5)
                        _card:start_materialize({G.C.SECONDARY_SET.Enhanced})
                        added[#added+1] = _card
                    end
                    playing_card_joker_effects(added)
                    local front = pseudorandom_element(G.P_CARDS, pseudoseed('pencil_drawing'))
                    card.ability.extra.rank = front.value
                    card.ability.extra.suit = front.suit
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
                card.ability.extra.amount,
                localize(card.ability.extra.rank, 'ranks'),
                localize(card.ability.extra.suit, 'suits_plural'),
                colours = { 
                    G.C.SECONDARY_SET.Enhanced,
                    G.C.SUITS[card.ability.extra.suit]
                }
            }
        }
    end,

    set_ability = function(self, card, initial, delay_sprites)
        local front = pseudorandom_element(G.P_CARDS, pseudoseed('pencil_drawing'))
        card.ability.extra.rank = front.value
        card.ability.extra.suit = front.suit
    end,
  
    calculate = function(self, card, context)
        if context.after then
            local front = pseudorandom_element(G.P_CARDS, pseudoseed('pencil_drawing'))
            card.ability.extra.rank = front.value
            card.ability.extra.suit = front.suit
        end
    end
  
}
return { name = {"Jokers"}, items = {pencil_drawing} }
