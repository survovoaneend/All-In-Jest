SMODS.Joker {
    key = "silvio",
    config = {
      
    },
    loc_txt = {
      name = "Silvio",
      text ={
          "Retriggers all {C:attention}Kings{}",
          "once for every {C:attention}Queen{}",
          "held in hand.",
          "Kings give {X:red,C:white}X1.5{} Mult",
          "when scored"
      },
  },
    rarity = 4,
    pos = { x = 8, y = 0},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 8, y = 1},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  }