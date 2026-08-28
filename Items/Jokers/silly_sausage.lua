local silly_sausage = {
    object_type = "Joker",
    order = 60,
    lite = true,
    key = "silly_sausage",
    config = {
        extra = {
            current_discount = 4,
            discount_loss = 1
        }
    },
    attributes = { 'economy', 'reroll', 'shop' },
    rarity = 1,
    pos = { x = 3, y = 2 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    pools = {
        Food = true
    },
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.current_discount,
                card.ability.extra.discount_loss
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - card.ability.extra.current_discount
        calculate_reroll_cost(true)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + card.ability.extra.current_discount
        calculate_reroll_cost(true)
    end,
  
    calculate = function(self, card, context)
        if context.ending_shop then
            if card.ability.extra.current_discount - card.ability.extra.discount_loss <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.RED
                }
            else
                card.ability.extra.current_discount = card.ability.extra.current_discount - card.ability.extra.discount_loss
                G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + card.ability.extra.discount_loss
                calculate_reroll_cost(true)
                return {
                    message = "-$" .. card.ability.extra.discount_loss .. " Discount",
                    colour = G.C.RED
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = { silly_sausage } }