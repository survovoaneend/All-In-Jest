local goofball = {
    object_type = "Joker",
    order = 233,
    
    key = "goofball",
    config = {
      extra = {
        percent = 5
      }
    },
    rarity = 3,
    pos = { x = 22, y = 8},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percent
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
        if context.other_card:is_face() then
           
            return {
               balance_percent(context.other_card,(card.ability.extra.percent*0.01)),
                card = card
            }
        end
      end
    end
  
}
return { name = {"Jokers"}, items = {goofball} }
