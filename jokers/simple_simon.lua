SMODS.Joker {
    key = "simple_simon",
    config = {
      extra = {
        chips = 50
      }
    },
    rarity = 1,
    pos = { x = 15, y = 5 },
    atlas = 'joker_atlas',
    cost = 2,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.chips
        }
      }
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
        return {
          chips = card.ability.extra.chips
        }
      end
    end
  }