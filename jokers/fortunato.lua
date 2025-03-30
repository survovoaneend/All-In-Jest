SMODS.Joker {
    key = "fortunato",
    config = {
      
    },
    loc_txt = {
      name = "Fortunato",
      text ={
          "Turns all {C:attention}played{} but not scored",
          "{C:attention}cards{} into {C:attention}Stone Cards{}.",
          "This {C:attention}Joker{} gains {X:red,C:white}X0.15{} Mult",
          "when a {C:attention}Stone Card{} is scored.",
          "{C:inactive}(Currently{} {X:red,C:white}X1{} {C:inactive}Mult){}",
      },
  },
    rarity = 4,
    pos = { x = 5, y = 0},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 5, y = 1},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  }