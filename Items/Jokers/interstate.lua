local interstate = {
    object_type = "Joker",
    order = 295,
    
    key = "interstate",
    config = {
      extra = {
        hands = 2
      }
    },
    rarity = 1,
    pos = { x = 17, y = 11},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    pixel_size = { w = 71, h = 84 },
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hands
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.before and context.scoring_name then
            if G.GAME.current_round.hands_played == 0 and context.poker_hands and next(context.poker_hands['Straight']) then
                ease_hands_played(card.ability.extra.hands)
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_hands', vars = {card.ability.extra.hands}}})
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {interstate} }
