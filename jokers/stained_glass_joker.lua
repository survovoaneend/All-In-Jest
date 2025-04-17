SMODS.Joker {
    key = "stained_glass_joker",
    config = {
      
    },
    loc_txt = {
      name = "Stained Glass Joker",
      text ={
          "{C:attention}Glass{} cards count as any {C:attention}suit{}",

      },
  },
    rarity = 2,
    pos = { x = 17, y = 8},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  }