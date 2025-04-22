SMODS.Joker {
    key = "heidelberg_tun",
    config = {
      extra = {
        odds = 3
      }
    },
    rarity = 2,
    pos = { x = 21, y = 4 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue + 1] = G.P_CENTERS.e_negative_consumable
      return {
        vars = {
          G.GAME.probabilities.normal, 
          card.ability.extra.odds
        }
      }
    end,
  
    calculate = function(self, card, context)
      if context.buying_card and context.card and context.card.ability.consumeable and not context.blueprint then
          local bought_card = context.card
          if not bought_card.edition and not bought_card.volatile_processed then
              if pseudorandom('heidelberg'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds then
                  bought_card.volatile_processed = true
                  G.E_MANAGER:add_event(Event({
                    func = function()
                      if bought_card and not bought_card.removed then
                        
                        bought_card:set_edition({negative = true}, true)
                        end
                        return true
                    end
                })) 
                  return true
              end
              bought_card.volatile_processed = true
          end
      end
      return nil
  end
}