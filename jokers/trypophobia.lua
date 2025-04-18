SMODS.Joker {
    key = "trypophobia",
    config = {
      extra = {
        mult = 20,
      }
    },
    loc_txt = {
      name = "Trypophobia",
      text ={
          "{C:red}+#1#{} Mult if played hand",
          "contains only {C:attention}8s{}",
      },
  },
    rarity = 1,
    pos = { x = 15, y = 0 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.mult,
        }
      }
    end,
  
    calculate = function(self, card, context)
      
      local eights, all_cards = 0, 0
      if context.joker_main then
        for k, v in ipairs(context.full_hand) do
          all_cards = all_cards + 1
          if v:get_id() == 8 then
            eights = eights + 1
          end
        end
       if eights == all_cards then 
          return {
            mult = card.ability.extra.mult,
          }
        end
      end
    end
  }