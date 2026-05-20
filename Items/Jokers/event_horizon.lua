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
    rarity = 3,
    pos = { x = 13, y = 6},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    
    loc_vars = function(self, info_queue, card)
       return {
           vars = {
               card.ability.extra.xmult_mod,
               card.ability.extra.xmult,
           }
       }
    end,
    
    calculate = function(self, card, context)
        if context.poker_hand_changed and context.new_level > context.old_level then
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
                card.ability.extra.xmult = card.ability.extra.xmult + (card.ability.extra.xmult_mod*amt)
                return {
                    message = localize('k_upgrade_ex')
                }
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
