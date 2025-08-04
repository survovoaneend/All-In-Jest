local scorecard = {
    object_type = "Joker",
    order = 69,

    key = "scorecard",
    config = {
      extra = {
        levels = 2,
        scorecard_poker_hand = nil
      }
    },
    rarity = 1,
    pos = { x = 15, y = 2 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.levels
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.setting_blind then
            local _poker_hands = {}
            for k, v in pairs(G.GAME.hands) do
                if v.visible and k ~= card.ability.scorecard_poker_hand then _poker_hands[#_poker_hands + 1] = k end
            end

            --code from full_moon from paperback
            local hand = pseudorandom_element(_poker_hands, pseudoseed('scorecard'))
            local eff_card = context.blueprint_card or card

            
                -- This is a copy of how a planet card sets the text when upgrading a hand (just formatted better)
                update_hand_text(
                    { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                    {
                        handname = localize(hand, 'poker_hands'),
                        chips = G.GAME.hands[hand].chips,
                        mult = G.GAME.hands[hand].mult,
                        level = G.GAME.hands[hand].level
                    }
                )

                G.E_MANAGER:add_event(Event {
                    func = function()
                        eff_card:juice_up()
                        return true
                    end
                })

                level_up_hand(eff_card, hand, nil, card.ability.extra.levels)

                update_hand_text(
                    { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
                    { mult = 0, chips = 0, handname = '', level = '' }
                )
            end
        end

}
return { name = {"Jokers"}, items = {scorecard} }
