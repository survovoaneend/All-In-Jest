SMODS.Joker {
    key = "jumbo_joker",
    config = {
      
    },
    loc_txt = {
      name = "Jumbo Joker",
      text ={
          "Only {C:attention}Jumbo{} and {C:attention}Mega{} Booster",
          "Packs can appear"
      },
  },
    rarity = 2,
    pos = { x = 10, y = 5 },
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