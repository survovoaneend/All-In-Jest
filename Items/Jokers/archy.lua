local archy = {
    object_type = "Joker",
    order = 1021,

    key = "archy",
    config = {
      
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 0, y = 4},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 0, y = 5},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.entering_shop then
            if G.shop_jokers then
                for i = 1, #G.shop_jokers.cards do
                    G.shop_jokers.cards[i].ability.couponed = true
                    G.shop_jokers.cards[i]:set_cost()
                end
            end
            if G.shop_booster then
                for i = 1, #G.shop_booster.cards do
                    G.shop_booster.cards[i].ability.couponed = true
                    G.shop_booster.cards[i]:set_cost()
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {archy} }
