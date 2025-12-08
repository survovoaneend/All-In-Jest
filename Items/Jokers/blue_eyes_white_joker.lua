local blue_eyes_white_joker = {
    object_type = "Joker",
    order = 285,
    key = "blue_eyes_white_joker",
    config = {
      extra = { retriggers = 1 }
    },
    rarity = 3,
    pos = { x = 8, y = 11},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.retriggers}}
    end,
  
    calculate = function(self, card, context)
        if context.after and context.full_hand and G.GAME.current_round.hands_left == 0 then
            if #context.full_hand == 1 then
                context.full_hand[1].ability.perma_repetitions = context.full_hand[1].ability.perma_repetitions + card.ability.extra.retriggers
                return {
                    extra = {message = localize('k_upgrade_ex'), message_card = context.full_hand[1], colour = G.C.FILTER},
                    colour = G.C.FILTER,
                    juice_card = context.blueprint_card or card
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {blue_eyes_white_joker} }
