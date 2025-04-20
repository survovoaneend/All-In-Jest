SMODS.Joker {
    key = "mondrian_joker",
    config = {
      extra = {
        mult_mod = 4
      }
    },
    rarity = 1,
    pos = { x = 3, y = 8},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    
    loc_vars = function(self, info_queue, card)
      local four_count = 0
        if G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.base.value == '4' and card.config.center.key ~= 'm_stone' then
                    four_count = four_count + 1
                end
            end
        end
        local current_mult = four_count * card.ability.extra.mult_mod
        return { vars = {card.ability.extra.mult_mod, current_mult} }
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
          local four_count = 0
          if G.playing_cards then
              for _, deck_card in ipairs(G.playing_cards) do
                  if deck_card.base.value == '4' and deck_card.config.center.key ~= 'm_stone' then
                      four_count = four_count + 1
                  end
              end
          end

          local total_mult = four_count * card.ability.extra.mult_mod

          if total_mult > 0 then
              return {
                  mult = total_mult, 
              }
          end
      end
  end

  }