SMODS.Joker {
    key = "invisible_man",
    config = {
      
    },
    loc_txt = {
      name = "Invisible Man",
      text ={
          "All face cards count as {C:attention}[Jacks/Queens/Kings]{}.",
          "Rank changes every round."
      },
  },
    rarity = 2,
    pos = { x = 4, y = 0 },
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