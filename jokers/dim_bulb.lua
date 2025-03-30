SMODS.Joker {
    key = "dim_bulb",
    config = {
      
    },
    loc_txt = {
      name = "Dim Bulb",
      text ={
          "{X:red,C:white}X3{} Mult if only {C:blue}Common",
          "{C:attention}Jokers{} are owned"
      },
  },
    rarity = 1,
    pos = { x = 5, y = 3 },
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