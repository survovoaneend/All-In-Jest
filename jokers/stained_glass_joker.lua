SMODS.Joker {
    key = "stained_glass_joker",
    config = {
      
    },
    rarity = 2,
    pos = { x = 17, y = 8},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue+1] = G.P_CENTERS.m_glass
    end,
  
    calculate = function(self, card, context)
      
    end,
    in_pool = function(self, args)
      local glass = 0
      if G.GAME and G.playing_cards then
          for _, card in ipairs(G.playing_cards) do
              if card.config.center.key == 'm_glass' then
                glass = glass + 1
              end
          end
      end
      if glass > 0 then
          return true
      else
          return false
      end
    end,
  }