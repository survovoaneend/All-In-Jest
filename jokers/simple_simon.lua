SMODS.Joker {
    key = "simple_simon",
    config = {
      extra = {
        chips = 50
      }
    },
    loc_txt = {
      name = "Simple Simon",
      text ={
          "{C:blue}+#1#{} Chips",
      },
  },
    rarity = 1,
    pos = { x = 15, y = 5 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
  
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