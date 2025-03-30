SMODS.Joker {
    key = "quark",
    config = {
      
    },
    loc_txt = {
      name = "Quark",
      text ={
          "Levels up {C:attention}Three of a Kind{} if",
          "{C:attention}scored hand{} contains exactly {C:attention}3{}",
          "cards and {C:attention}3{} unique suits."
      },
  },
    rarity = 2,
    pos = { x = 16, y = 3 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  }