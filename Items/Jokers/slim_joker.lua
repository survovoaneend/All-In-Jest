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
            local _mult = 0
            SMODS.scale_card(card, {
	            ref_table = card.ability.extra,
                ref_value = "initial_mult",
	            scalar_value = "mult_mod",
                operation = function(ref_table, ref_value, initial, change)
	                _mult = initial - change * #context.full_hand
                end,
                no_message = true,
            })
            if _mult > 0 then 
                return {
                    mult = _mult
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {slim_joker} }
