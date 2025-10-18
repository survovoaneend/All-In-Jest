local function jest_overdesigned_joker_cycle(suit)
    -- BUG: this is unsafe with language changes.
    -- should have better style: use the actual suit internally, don't localize
    -- except in loc_vars return
    if suit == localize('k_aij_overdesigned_heart', 'extra_joker_dictionary') then
        return {localize('k_aij_overdesigned_club', 'extra_joker_dictionary'), 14}, {localize('k_aij_overdesigned_give_prefix', 'extra_joker_dictionary'), localize('k_aij_youve_got_mail_plus_prefix', 'extra_joker_dictionary'), localize('k_aij_youve_got_mail_mult_text', 'extra_joker_dictionary').." "}, {G.C.SUITS.Clubs, G.C.MULT}
    elseif suit == localize('k_aij_overdesigned_club', 'extra_joker_dictionary') then
        return {localize('k_aij_overdesigned_diamond', 'extra_joker_dictionary'), 2}, {localize('k_aij_overdesigned_earn_prefix', 'extra_joker_dictionary'), localize('$'), " "}, {G.C.SUITS.Diamonds, G.C.MONEY}
    elseif suit == localize('k_aij_overdesigned_diamond', 'extra_joker_dictionary') then
        return {localize('k_aij_overdesigned_spade', 'extra_joker_dictionary'), 100}, {localize('k_aij_overdesigned_give_prefix', 'extra_joker_dictionary'), localize('k_aij_youve_got_mail_plus_prefix', 'extra_joker_dictionary'), localize('k_aij_youve_got_mail_chip_text', 'extra_joker_dictionary').." "}, {G.C.SUITS.Spades, G.C.CHIPS}
    elseif suit == localize('k_aij_overdesigned_spade', 'extra_joker_dictionary') then
        return {localize('k_aij_overdesigned_heart', 'extra_joker_dictionary'), 1.5}, {localize('k_aij_overdesigned_give_prefix', 'extra_joker_dictionary'), localize('k_aij_youve_got_mail_xmult_prefix', 'extra_joker_dictionary'), localize('k_aij_youve_got_mail_mult_text', 'extra_joker_dictionary').." "}, {G.C.SUITS.Hearts, G.C.WHITE, G.C.MULT}
    end
end
local overdesigned_joker = {
    object_type = "Joker",
    order = 230,
    
    key = "overdesigned_joker",
    config = {
      suit = nil,
      amount = 1.5,
      extra = {
          prefix = nil,
          symbol = nil,
          suffix = nil,
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
        if not card.ability.extra.prefix then
            card.ability.suit = localize('k_aij_overdesigned_heart', 'extra_joker_dictionary')
            card.ability.extra.prefix = localize('k_aij_overdesigned_give_prefix', 'extra_joker_dictionary')
            card.ability.extra.symbol = localize('k_aij_youve_got_mail_xmult_prefix', 'extra_joker_dictionary')
            card.ability.extra.suffix = localize('k_aij_youve_got_mail_mult_text', 'extra_joker_dictionary').." "
        end
        return {
            vars = {
                card.ability.suit,
                card.ability.amount,
                card.ability.extra.prefix,
                card.ability.extra.symbol,
                card.ability.extra.suffix,
                colours = {
                    card.ability.extra.colours.suit,
                    card.ability.extra.colours.amount,
                    card.ability.extra.colours.background
                }
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local cardd = context.other_card
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
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = card.ability.suit, colour = G.C.FILTER})
            end
            if cardd:is_suit(orig_suit) then
                if orig_suit == "Club" then
                    return {
                        mult = orig_amount,
                        card = card
                    }
                elseif orig_suit == "Diamond" then
                    return {
                        dollars = orig_amount,
                        card = card
                    }
                elseif orig_suit == "Spade" then
                    return {
                        chips = orig_amount,
                        card = card
                    }
                elseif orig_suit == "Heart" then
                    return {
                        x_mult = orig_amount,
                        card = card
                    }
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {overdesigned_joker} }
