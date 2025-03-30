SMODS.Joker {
    key = "touchstone",
    config = {
      
    },
    loc_txt = {
      name = "Touchstone",
      text ={
          "Reveals the next {C:attention}10 cards{}",
          "in your deck.",
          "{C:attention}+2{} hand size"
      },
  },
    rarity = 4,
    pos = { x = 4, y = 0},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 4, y = 1},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  }