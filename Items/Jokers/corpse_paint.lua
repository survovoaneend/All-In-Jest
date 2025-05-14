local corpse_paint = {
    object_type = "Joker",
    order = 212,
    ignore = true,
    key = "corpse_paint",
    config = {
      odds = 3,
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
        return { vars = { card.ability.odds, G.GAME.probabilities.normal or 1, card.ability.hand_size, card.ability.max_hand_size }}
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-tonumber(card.ability.max_hand_size))
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.edition ~= nil and context.other_card.edition.negative then
                context.other_card:set_edition(nil)
                if pseudorandom('corpse_paint') < G.GAME.probabilities.normal/card.ability.odds then
                    G.hand:change_size(card.ability.hand_size)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..card.ability.hand_size.." Hand size", colour = G.C.FILTER})
                    card.ability.max_hand_size = tostring(tonumber(card.ability.max_hand_size) + card.ability.hand_size)
                end
            end
        end
    end,
}
return { name = {"Jokers"}, items = {corpse_paint} }
