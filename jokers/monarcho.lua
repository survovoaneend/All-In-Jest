SMODS.Joker {
    key = "monarcho",
    config = {
      
    },
    loc_txt = {
      name = "Monarcho",
      text ={
          "Played {C:attention}Kings{} give {X:red,C:white}X4{} Mult.",
          "{C:green}1 in 2{} chance for played", 
          "{C:attention}Kings{} to be {C:red}destroyed{}",
          "after scoring"

      },
  },
    rarity = 4,
    pos = { x = 2, y = 0},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 2, y = 1},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  }