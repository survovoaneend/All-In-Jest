local bingsu = {
    object_type = "Joker",
    order = 986,

    key = "bingsu",
    config = {
        extra = {
            chips = 50,
            chip_loss = 1,
            odds = 3
        }
    },
    attributes = {'chips', 'food', 'scaling', 'chance'},
    rarity = 2,
    pos = { x = 10, y = 45},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return { 
            vars = {
                card.ability.extra.chips,
                card.ability.extra.chip_loss,
                numerator,
                denominator
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local chip_yield = card.ability.extra.chips
            
            if not context.blueprint then
                if SMODS.pseudorandom_probability(card, 'bingsu', 1, card.ability.extra.odds) then
                    card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chip_loss
                    
                    if card.ability.extra.chips <= 0 then
                        SMODS.destroy_cards(card, nil, nil, true)
                        return {
                            chips = chip_yield,
                            message = localize('k_eaten_ex'),
                            colour = G.C.CHIPS
                        }
                    else
                        return {
                            chips = chip_yield,
                            extra = {
                                message = localize { type = 'variable', key = 'a_chips_minus', vars = { card.ability.extra.chip_loss } },
                                colour = G.C.CHIPS,
                                message_card = card
                            }
                        }
                    end
                end
            end
            
            return {
                chips = chip_yield
            }
        end
    end
}
return { name = {"Jokers"}, items = {bingsu} }