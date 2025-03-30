SMODS.Joker {
    key = "grock",
    config = {
      
    },
    loc_txt = {
      name = "Grock",
      text ={
          "{C:attention}Retriggers{} Jokers to the left",
          "and right if {C:attention}played hand{} contains",
          "only {C:attention}Kings{}"
      },
  },
    rarity = 4,
    pos = { x = 1, y = 2},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 1, y = 3},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  }