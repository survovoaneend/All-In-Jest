local function jest_overdesigned_joker_cycle(suit)
    if suit == "Hearts" then
        return {"Clubs", 14}, {"k_aij_overdesigned_give_prefix", "k_aij_youve_got_mail_plus_prefix", "k_aij_youve_got_mail_mult_text"}, {G.C.SUITS.Clubs, G.C.MULT}
    elseif suit == "Clubs" then
        return {"Diamonds", 2}, {"k_aij_overdesigned_earn_prefix", "k_aij_youve_got_mail_dollar_prefix", ""}, {G.C.SUITS.Diamonds, G.C.MONEY}
    elseif suit == "Diamons" then
        return {"Spades", 100}, {"k_aij_overdesigned_give_prefix", "k_aij_youve_got_mail_plus_prefix", "k_aij_youve_got_mail_chip_text"}, {G.C.SUITS.Spades, G.C.CHIPS}
    elseif suit == "Spades" then
        return {"Hearts", 1.5}, {"k_aij_overdesigned_give_prefix", "k_aij_youve_got_mail_xmult_prefix", "k_aij_youve_got_mail_mult_text"}, {G.C.SUITS.Hearts, G.C.WHITE, G.C.MULT}
    else
        return {"Clubs", 14}, {"k_aij_overdesigned_give_prefix", "k_aij_youve_got_mail_plus_prefix", "k_aij_youve_got_mail_mult_text"}, {G.C.SUITS.Clubs, G.C.MULT}
    end
end


local overdesigned_joker = {
    object_type = "Joker",
    order = 230,
    
    key = "overdesigned_joker",
    config = {
        suit = "Hearts",
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
    rarity = 2,
    pos = { x = 19, y = 8},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local suits = {'overdesigned_spade', 'overdesigned_heart', 'overdesigned_club', 'overdesigned_diamond'}
        for _, key in ipairs(suits) do
          info_queue[#info_queue+1] = {set = 'Other', key = key}
        end
        return {
            vars = {
                localize(card.ability.suit, 'suits_plural'),
                card.ability.amount,
                localize(card.ability.extra.prefix, 'extra_joker_dictionary'),
                localize(card.ability.extra.symbol, 'extra_joker_dictionary'),
                localize(card.ability.extra.suffix, 'extra_joker_dictionary'),
                colours = {
                    card.ability.extra.colours.suit,
                    card.ability.extra.colours.amount,
                    card.ability.extra.colours.background
                }
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.end_of_round then
            local other_card = context.other_card
            local orig_suit = card.ability.suit
            local orig_amount = card.ability.amount

            if not context.blueprint then
                local suit_info, suffix_info, colour_info = jest_overdesigned_joker_cycle(card.ability.suit)
                card.ability.suit = suit_info[1]
                card.ability.amount = suit_info[2]
                card.ability.extra.prefix = suffix_info[1]
                card.ability.extra.symbol = suffix_info[2]
                card.ability.extra.suffix = suffix_info[3]
                card.ability.extra.colours.suit = colour_info[1]
                card.ability.extra.colours.amount = colour_info[2]
                card.ability.extra.colours.background = colour_info[3] or G.C.WHITE
            end

            -- sendDebugMessage(tprint(other_card), "AIJ")
            -- sendDebugMessage(orig_suit, "AIJ")

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
                -- Nested in "extra" to stop the playing card from 
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
