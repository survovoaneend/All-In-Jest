SMODS.Joker {
    key = "doink",
    config = {
      
    },
    loc_txt = {
      name = "Doink",
      text ={
          "Divides the score requirement of",
          "{C:attention}Small{} and {C:attention}Big Blinds{} by",
          "the {C:attention}current ante{}"
      },
  },
    rarity = 4,
    pos = { x = 1, y = 0},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 1, y = 1},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  }