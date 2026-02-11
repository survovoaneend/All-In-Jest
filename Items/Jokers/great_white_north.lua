local great_white_north = {
    object_type = "Joker",
    order = 65,
    
    key = "great_white_north",
    config = {
      extra = {
        mult = 1
      }
    },
    rarity = 1,
    pos = { x = 11, y = 2 },
    atlas = 'joker_atlas',
    cost = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,
  
    calculate = function(self, card, context)
       if context.individual and context.cardarea == G.play then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {great_white_north} }
