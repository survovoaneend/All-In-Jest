SMODS.Joker {
    key = "sneaky_pete",
    config = {
      
    },
    loc_txt = {
      name = "Sneaky Pete",
      text ={
          'Earn {C:money}$1{} at end of round',
            'for every {C:money}Gold Seal{}',
            'in your {C:attention}full deck',
            '{C:inactive}(Currently {C:money}$#1#{C:inactive})'
      },
  },
    rarity = 1,
    pos = { x = 22, y = 5 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      local seal_count = 0
      if G.GAME and G.playing_cards then
          for _, card in ipairs(G.playing_cards) do
              if card.seal == 'Gold' then
                  seal_count = seal_count + 1
              end
          end
      end
      return {
        vars = {
          seal_count
        }
      }
    end,
  
    calculate = function(self, card, context)
      
    end,
    calc_dollar_bonus = function(self, card)
      local seal_count = 0
      if G.GAME and G.playing_cards then
        for _, card in ipairs(G.playing_cards) do
            if card.seal == 'Gold' then
                seal_count = seal_count + 1
            end
        end
    end
      if seal_count > 0 then
        local dollar_bonus = seal_count or 0
          return dollar_bonus
      end
  end
  }