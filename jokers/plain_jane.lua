SMODS.Joker {
    key = "plain_jane",
    config = {
      extra = {
        mult = 5
      }
    },
    rarity = 1,
    pos = { x = 15, y = 1 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.mult
        }
      }
    end,
  
    calculate = function(self, card, context)
       if context.individual and context.cardarea == G.play then
        local scored_card = context.other_card
        if scored_card.config.center == G.P_CENTERS.c_base then
            return {
                mult = card.ability.extra.mult,
                card = card 
            }
        end
    end

    return nil
    end
  }