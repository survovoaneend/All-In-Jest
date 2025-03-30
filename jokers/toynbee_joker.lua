SMODS.Joker {
    key = "toynbee_joker",
    config = {
      
    },
    loc_txt = {
      name = "Toynbee Joker",
      text ={
          "Gives the {C:planet}Planet{} card for the",
          "{C:attention}first played{} poker hand",
          "this round when {C:attention}Blind{} is", 
          "{C:attention}defeated{}"
        },
  },
    rarity = 2,
    pos = { x = 6, y = 8},
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