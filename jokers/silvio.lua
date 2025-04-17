SMODS.Joker {
    key = "silvio",
    config = {
      
    },
    loc_txt = {
      name = "Silvio",
      text ={
          "Retriggers all {C:attention}Kings{}",
          "once for every {C:attention}Queen{}",
          "held in hand.",
          "Kings give {X:red,C:white}X1.5{} Mult",
          "when scored"
      },
  },
    rarity = 4,
    pos = { x = 8, y = 0},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 8, y = 1},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      -- Retrigger Kings based on Queens in hand
      if context.repetition and context.cardarea == G.play then
          -- Check if the card being scored is a King (ID 13)
          if context.other_card and context.other_card:get_id() == 13 then
              local queen_count = 0
              if G.hand and G.hand.cards then
                  for _, hand_card in ipairs(G.hand.cards) do
                      if hand_card:get_id() == 12 then -- Queen ID
                          queen_count = queen_count + 1
                      end
                  end
              end

              -- If there are Queens in hand, return the retrigger effect
              if queen_count > 0 then
                  return {
                      message = localize('k_again_ex'),
                      repetitions = queen_count,
                      card = card -- Reference this joker for UI feedback
                  }
              end
          end
      end

      -- Give Kings X1.5 Mult
      if context.individual and context.cardarea == G.play then
           -- Check if the card being scored is a King (ID 13)
          if context.other_card and context.other_card:get_id() == 13 then
              return {
                x_mult = 1.5,
              }
          end
      end
  end
  }