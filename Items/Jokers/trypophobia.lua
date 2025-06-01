local trypophobia = {
    object_type = "Joker",
    order = 16,

    key = "trypophobia",
    config = {
      extra = {
        mult = 20,
      }
    },
    rarity = 1,
    pos = { x = 15, y = 0 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
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
        for k, v in ipairs(context.scoring_hand) do
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
return { name = {"Jokers"}, items = {trypophobia} }
