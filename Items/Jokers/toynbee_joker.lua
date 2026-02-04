local toynbee_joker = {
    object_type = "Joker",
    order = 217,

    key = "toynbee_joker",
    config = {
      extra = {
          first_hand = nil
      }
    },
    rarity = 2,
    pos = { x = 6, y = 8},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.first_hand or localize('k_none')
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.before and G.GAME.current_round.hands_played == 0 then
            card.ability.extra.first_hand = context.scoring_name
        end
        if context.end_of_round and context.game_over == false and not context.blueprint then
            if card.ability.extra.first_hand then
                local planet_key
                for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                    if v.config.hand_type == card.ability.extra.first_hand and not v.config.moon then
                        planet_key = v.key
                    end
                end
                if planet_key and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({ key = planet_key, area = G.consumeables })
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    card.ability.extra.first_hand = nil
                    return { message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet }
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {toynbee_joker} }
