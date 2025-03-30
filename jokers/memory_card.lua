SMODS.Joker {
    key = "memory_card",
    config = {
      
    },
    loc_txt = {
      name = "Memory Card",
      text ={
          "If first hand of round has",
          "only {C:attention}1{} card, that card is",
          "always drawn {C:attention}first{}.",
          "{C:inactive,s:0.9}(Can only store 1 card){}"
      },
  },
    rarity = 3,
    pos = { x = 3, y = 0 },
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