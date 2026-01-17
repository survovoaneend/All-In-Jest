local function jest_overdesigned_joker_cycle(suit)
    if suit == "Hearts" then
        return "Clubs"
    elseif suit == "Clubs" then
        return "Diamonds"
    elseif suit == "Diamonds" then
        return "Spades"
    elseif suit == "Spades" then
        return "Hearts"
    else
        return "Clubs"
    end
end

local jest_get_overdesigned_ability = {
    ["Hearts"] = {
        amount = 1.5,
        extra = {
            prefix = 'k_aij_overdesigned_give_prefix',
            symbol = 'k_aij_youve_got_mail_xmult_prefix',
            suffix = 'k_aij_youve_got_mail_mult_text',
            colours = {
                suit = G.C.SUITS.Hearts,
                amount = G.C.WHITE,
                background = G.C.MULT
            }
        }
    },
    ["Clubs"] = {
        amount = 14,
        extra = {
            prefix = 'k_aij_overdesigned_give_prefix',
            symbol = 'k_aij_youve_got_mail_plus_prefix',
            suffix = 'k_aij_youve_got_mail_mult_text',
            colours = {
                suit = G.C.SUITS.Clubs,
                amount = G.C.MULT,
            }
        }
    },
    ["Diamonds"] = {
        amount = 2,
        extra = {
            prefix = 'k_aij_overdesigned_earn_prefix',
            symbol = 'k_aij_youve_got_mail_dollar_prefix',
            colours = {
                suit = G.C.SUITS.Diamonds,
                amount = G.C.MONEY,
            }
        }
    },
    ["Spades"] = {
        amount = 100,
        extra = {
            prefix = 'k_aij_overdesigned_give_prefix',
            symbol = 'k_aij_youve_got_mail_plus_prefix',
            suffix = 'k_aij_youve_got_mail_chip_text',
            colours = {
                suit = G.C.SUITS.Spades,
                amount = G.C.CHIPS,
            }
        }
    }
}

local function round_hundredth(x)
    if x >= 0 then
        return math.floor(x * 100 + 0.5) / 100
    else
        return math.ceil(x * 100 - 0.5) / 100
    end
end


local overdesigned_joker = {
    object_type = "Joker",
    order = 230,
    
    key = "overdesigned_joker",
    config = {
        suit = "Hearts",
        silver_multiplier_buff = 100, -- Make 100 instead of 1 to keep 2 decimals of precision
    },
    rarity = 2,
    pos = { x = 19, y = 8},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local suits = {Spades = 'overdesigned_spade', Hearts = 'overdesigned_heart', Clubs = 'overdesigned_club', Diamonds = 'overdesigned_diamond'}
        for suit_key, loc_key in pairs(suits) do
            info_queue[#info_queue+1] = {set = 'Other', key = loc_key, vars={
                round_hundredth(jest_get_overdesigned_ability[suit_key].amount * (card.ability.silver_multiplier_buff / 100))
            }}
        end

        local current_suit_ability = jest_get_overdesigned_ability[card.ability.suit]

        return {
            vars = {
                localize(card.ability.suit, 'suits_plural'),
                round_hundredth(current_suit_ability.amount * (card.ability.silver_multiplier_buff / 100)),
                current_suit_ability.extra.prefix and localize(current_suit_ability.extra.prefix, 'extra_joker_dictionary') or '',
                current_suit_ability.extra.symbol and localize(current_suit_ability.extra.symbol,  'extra_joker_dictionary') or '',
                current_suit_ability.extra.suffix and localize(current_suit_ability.extra.suffix, 'extra_joker_dictionary') or '',
                colours = {
                    current_suit_ability.extra.colours.suit,
                    current_suit_ability.extra.colours.amount,
                    current_suit_ability.extra.colours.background or G.C.WHITE,
                    (card.ability.suit == "Hearts" and current_suit_ability.extra.colours.suit) or G.C.UI.TEXT_INACTIVE,
                    (card.ability.suit == "Clubs" and current_suit_ability.extra.colours.suit) or G.C.UI.TEXT_INACTIVE,
                    (card.ability.suit == "Diamonds" and current_suit_ability.extra.colours.suit) or G.C.UI.TEXT_INACTIVE,
                    (card.ability.suit == "Spades" and current_suit_ability.extra.colours.suit) or G.C.UI.TEXT_INACTIVE,
                }
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.end_of_round then
            local other_card = context.other_card
            local orig_suit = card.ability.suit
            local current_suit_ability = jest_get_overdesigned_ability[card.ability.suit]
            local orig_amount = round_hundredth(current_suit_ability.amount * (card.ability.silver_multiplier_buff / 100))

            if not context.blueprint then
                card.ability.suit = jest_overdesigned_joker_cycle(card.ability.suit)
            end

            local juiced_card = context.blueprint_card or card
            if other_card:is_suit(orig_suit) then
                if orig_suit == "Clubs" then
                    return {
                        mult = orig_amount,
                        card = card,
                        extra = {
                            message_card = juiced_card,
                            message = card.ability.suit,
                            colour = G.C.FILTER
                        }
                    }
                elseif orig_suit == "Diamonds" then
                    return {
                        dollars = orig_amount,
                        card = card,
                        extra = {
                            message_card = juiced_card,
                            message = card.ability.suit,
                            colour = G.C.FILTER
                        }
                    }
                elseif orig_suit == "Spades" then
                    return {
                        chips = orig_amount,
                        card = card,
                        extra = {
                            message_card = juiced_card,
                            message = card.ability.suit,
                            colour = G.C.FILTER
                        }
                    }
                elseif orig_suit == "Hearts" then
                    return {
                        x_mult = orig_amount,
                        card = card,
                        extra = {
                            message_card = juiced_card,
                            message = card.ability.suit,
                            colour = G.C.FILTER
                        }
                    }
                end
            else
                -- Nested in "extra" to stop the playing card from juicing
                return {
                    extra = {
                        message_card = juiced_card,
                        message = card.ability.suit,
                        colour = G.C.FILTER
                    }
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {overdesigned_joker} }
