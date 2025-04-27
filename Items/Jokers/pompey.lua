local pompey = {
    object_type = "Joker",
    order = 249,

    key = "pompey",
    config = {
      extra = {
        xmult = 1.5
      }
    },
    rarity = 4,
		unlock_condition = {hidden = true},
    pos = { x = 3, y = 0},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 3, y = 1},
  
    loc_vars = function(self, info_queue, card)
      local jokers_to_right = 0
        if G.jokers and G.jokers.cards and card.area == G.jokers then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos then
                jokers_to_right = #G.jokers.cards - my_pos + 1
            end
        end
        return {vars = {card.ability.extra.xmult, math.max(card.ability.extra.xmult, (jokers_to_right*card.ability.extra.xmult))}} 
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
        local jokers_to_right = 0
        if G.jokers and G.jokers.cards and card.area == G.jokers then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end

            if my_pos then
                
                jokers_to_right = #G.jokers.cards - my_pos + 1
            end
        end

        local final_xmult = math.max(card.ability.extra.xmult, (jokers_to_right*card.ability.extra.xmult)) 
        if final_xmult > 1 then
            return {
                message = localize{type='variable',key='a_xmult',vars={final_xmult}},
                Xmult_mod = final_xmult,
                card = card
            }
        end
    end
    end
  
}
return { name = {"Jokers"}, items = {pompey} }
