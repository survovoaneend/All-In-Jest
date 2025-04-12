SMODS.Joker {
    key = "jack_of_all_trades",
    config = {
      
    },
    loc_txt = {
      name = "Jack of All Trades",
      text ={
          "{C:attention}Jacks{} count as any {C:attention}suit",
      },
  },
    rarity = 2,
    pos = { x = 9, y = 5 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  }