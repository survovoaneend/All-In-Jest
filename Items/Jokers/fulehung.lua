local fulehung = {
    object_type = "Joker",
    order = 207,

    key = "fulehung",
    config = {
      extra = {
          odds = 3,
      }
    },
    rarity = 2,
    pos = { x = 21, y = 7},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.setting_blind then
            if G.GAME.round_resets.blind_tags[G.GAME.blind_on_deck] and SMODS.pseudorandom_probability(card, 'fulehung', 1, card.ability.extra.odds) then
                add_tag(Tag(G.GAME.round_resets.blind_tags[G.GAME.blind_on_deck]))
                card:juice_up(0.4, 0.4)
                play_sound('tarot1')
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                      message = localize('aij_plus_tag')
                })
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {fulehung} }
