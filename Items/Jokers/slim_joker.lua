local slim_joker = {
    object_type = "Joker",
    order = 51,
     
    key = "slim_joker",
    config = {
      extra = {
        initial_mult = 24,
        mult_mod = 4
      }
    },
    rarity = 1,
    pos = { x = 22, y = 1 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    pixel_size = { w = 59, h = 93 },
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.initial_mult,
                card.ability.extra.mult_mod
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            local _mult = card.ability.extra.initial_mult - card.ability.extra.mult_mod * #context.full_hand
            if _mult > 0 then 
                return {
                    mult = _mult
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {slim_joker} }
