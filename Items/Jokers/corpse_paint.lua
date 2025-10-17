local corpse_paint = {
    object_type = "Joker",
    order = 212,
    
    key = "corpse_paint",
    config = {
      odds = 2,
      hand_size = 1,
      max_hand_size = "0"
    },
    rarity = 2,
    pos = { x = 1, y = 8},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        if All_in_Jest.config and All_in_Jest.config.no_copy_neg then
            info_queue[#info_queue+1] = {key = 'e_negative_playing_card', set = 'Edition', config = {extra = G.P_CENTERS['e_negative'].config.card_limit} }
        else
            info_queue[#info_queue+1] = G.P_CENTERS.e_aij_negative_playing_card
        end
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.odds)
        return { vars = { numerator, denominator, card.ability.hand_size, card.ability.max_hand_size }}
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-tonumber(card.ability.max_hand_size))
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.edition ~= nil and context.other_card.edition.negative then
                context.other_card:set_edition(nil)
                if SMODS.pseudorandom_probability(card, 'corpse_paint', 1, card.ability.odds) then
                    G.hand:change_size(card.ability.hand_size)
                    local hand_size = tonumber(card.ability.max_hand_size)
                    SMODS.scale_card(card, {
	                    ref_table = card.ability,
                        ref_value = "max_hand_size",
	                    scalar_value = "hand_size",
                        operation = function(ref_table, ref_value, initial, change)
	                        ref_table[ref_value] = tostring(tonumber(initial) + change)
                        end,
                        message_key = 'a_handsize'
                    })
                end
            end
        end
    end,

    in_pool = function(self, args)
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.edition and card.edition.negative then
                    return true
                end
            end
        end
        return false
    end
}
return { name = {"Jokers"}, items = {corpse_paint} }
