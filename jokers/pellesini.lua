SMODS.Joker {
    key = "pellesini",
    config = {
      
    },
    loc_txt = {
      name = "Pellesini",
      text ={
          "This {C:attention}Joker{} gains {X:red,C:white}X0.5{} Mult",
          "upon leaving a {C:attention}shop{} without",
          "{C:green}rerolling{}.",
          "{C:inactive}(Currently{} {X:red,C:white}X1{} {C:inactive}Mult){}",
      },
  },
    rarity = 4,
    pos = { x = 6, y = 0},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 6, y = 1},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  }