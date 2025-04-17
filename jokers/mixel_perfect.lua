SMODS.Joker {
    key = "mixel_perfect",
    config = {
      extra = {
        mult = 10
      }
    },
    loc_txt = {
      name = "Mixel Perfect",
      text ={
          "{C:red}+#1#{} Mult if {C:attention}played hand{}",
          "contains an {C:attention}odd{} number",
          "of cards"
      },
  },
    rarity = 1,
    pos = { x = 10, y = 4 },
    atlas = 'joker_atlas',
    cost = 4,
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
      if context.joker_main and math.fmod(#context.full_hand, 2) == 1 then
        return {
          mult = card.ability.extra.mult
        }
      end
    end
  }