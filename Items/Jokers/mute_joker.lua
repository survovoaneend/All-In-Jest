local mute_joker = {
    object_type = "Joker",
    order = 105,

    key = "mute_joker",
    config = {
      extra = {
          poker_hand = "(hand)",
          trigger = false
      }
    },
    rarity = 1,
    pos = { x = 0, y = 4 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.poker_hand,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local _poker_hands = {}
            for k, v in pairs(G.GAME.hands) do
                if v.visible and k ~= card.ability.extra.poker_hand then _poker_hands[#_poker_hands + 1] = k end
            end
            card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed('mute_joker'))
            card.ability.extra.trigger = false
            return {
                message = localize('k_reset')
            }
        end
        if context.after and not card.ability.extra.trigger and card.ability.extra.poker_hand ~= "(hand)" then
            if context.scoring_name == card.ability.extra.poker_hand then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for i = 1, #context.full_hand do
                            context.full_hand[i]:start_dissolve()
                        end
                        return true
                    end
                }))
                card.ability.extra.trigger = true
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {mute_joker} }
