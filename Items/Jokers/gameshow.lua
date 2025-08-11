local gameshow = {
    object_type = "Joker",
    order = 306,
    key = "gameshow",
    config = {
      extra = {
          odds = 4,
          money = 3,
      }
    },
    rarity = 2,
    pos = { x = 3, y = 12},
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
                card.ability.extra.money
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.setting_blind then
            local jokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].edition == nil then
                    table.insert(jokers, G.jokers.cards[i])
                end
            end
            if #jokers > 0 then
                if SMODS.pseudorandom_probability(card, 'gameshow', 1, card.ability.extra.odds) then 
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                        local eligible_card = pseudorandom_element(jokers, pseudoseed('gameshow'))
                        local edition = nil
                        edition = poll_edition('wheel_of_fortune', nil, true, true)
                        eligible_card:set_edition(edition, true)
                        card:juice_up(0.3, 0.5)
                    return true end }))
                else
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_nope_ex'), colour = G.C.SECONDARY_SET.Tarot})
                    return true end }))
                end
                return {
                    card = card,
                    dollars = -card.ability.extra.money,
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {gameshow} }
