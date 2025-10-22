local yu_sze = {
    object_type = "Joker",
    order = 1034,
    
    key = "yu_sze",
    config = {
      xmult = 2
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 3, y = 6},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 3, y = 7},
  
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.xmult}}
    end,
  
    calculate = function(self, card, context)
        if context.other_joker and context.other_joker.edition == nil then
            G.E_MANAGER:add_event(Event({
                func = function()
                    context.other_joker:juice_up(0.5, 0.5)
                    return true
                end
            }))
            return {
                xmult = card.ability.xmult
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {yu_sze} }
