local event_horizon = {
    object_type = "Joker",
    order = 169,
    key = "event_horizon",
    config = {
      extra = {
          xmult_mod = 0.2,
          xmult = 1,
          last_hand = ''
      }
    },
    attributes = { 'xmult', 'scaling', 'reset', 'hand_level' },
    rarity = 3,
    lite = true,
    pos = { x = 13, y = 6},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    
    loc_vars = function(self, info_queue, card)
       return {
           vars = {
               card.ability.extra.xmult_mod,
               card.ability.extra.xmult,
               card.ability.extra.last_hand and card.ability.extra.last_hand ~= '' and localize(card.ability.extra.last_hand, 'poker_hands') or 'None'
           }
       }
    end,
    
    calculate = function(self, card, context)
        if context.poker_hand_changed and context.new_level > context.old_level and not context.blueprint then
            local amt = context.new_level - context.old_level
            if amt > 1 or card.ability.extra.last_hand == context.scoring_name then
                card.ability.extra.xmult = 1
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
            end
            if amt == 1 then
                card.ability.extra.last_hand = context.scoring_name
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xmult",
                    scalar_value = "xmult_mod"
                })
                return nil, true
            end
        end
        if context.joker_main then
            return {
               xmult = card.ability.extra.xmult
            }
        end
    end
}
return { name = {"Jokers"}, items = {event_horizon} }
