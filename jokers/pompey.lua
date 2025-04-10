SMODS.Joker {
    key = "pompey",
    config = {
      
    },
    loc_txt = {
      name = "Pompey",
      text ={
          "{X:red,C:white}X1{} Mult per {C:attention}Joker{} to",
          "the {C:attention}right{} of this one.",
          "Pompey included",
          "{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive} Mult){}"
          
      },
  },
    rarity = 4,
    pos = { x = 3, y = 0},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = true,
    discovered = true,
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
        return {vars = {math.max(1, jokers_to_right)}} -- Ensure Xmult is at least 1
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
                -- Count jokers from this position to the end
                jokers_to_right = #G.jokers.cards - my_pos + 1
            end
        end

        local final_xmult = math.max(1, jokers_to_right) -- Calculate Xmult, ensuring it's at least 1

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