SMODS.Joker {
    key = "stained_glass_joker",
    config = {
      
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
      info_queue[#info_queue+1] = G.P_CENTERS.m_glass
    end,
  
    calculate = function(self, card, context)
      
    end
  }