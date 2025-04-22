SMODS.Joker {
    key = "penny",
    config = {
      extra = {
        odds = 2
      }
    },
    rarity = 1,
    pos = { x = 1, y = 2 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,

    pixel_size = { w = 53, h = 53 },
  
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue+1] = G.P_SEALS['Gold']
      return {
        vars = {
          G.GAME.probabilities.normal,
          card.ability.extra.odds
        }
      }
      
    end,
  
    calculate = function(self, card, context)
      if context.repetition and context.other_card then
          if context.other_card.seal == 'Gold' then
              if pseudorandom('penny'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds then
                  return {
                      message = localize('k_again_ex'),
                      repetitions = 1,
                      card = card, 
                      colour = G.C.GOLD 
                  }
              end
          end
      end

      return nil
  end
  }