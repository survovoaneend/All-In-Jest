local yu_sze = {
    object_type = "Joker",
    order = 1034,
     ignore = true,
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
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 3, y = 7},
  
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.xmult}}
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].edition == nil then
                    SMODS.calculate_effect({xmult = card.ability.xmult}, G.jokers.cards[i])
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {yu_sze} }
