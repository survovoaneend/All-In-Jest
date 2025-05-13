local square_eyes = {
    object_type = "Joker",
    order = 49,
     ignore = true,
    key = "square_eyes",
    config = {
      extra = {
        mult_per_four = 2
      }
    },
    rarity = 1,
    pos = { x = 20, y = 1 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_per_four
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play and context.other_card then
            if context.other_card:get_id() == 4 then
                local fours_in_played_hand = 0
                if context.full_hand then 
                    for _, p_card_in_full_hand in ipairs(context.full_hand) do
                        if p_card_in_full_hand:get_id() == 4 then
                            fours_in_played_hand = fours_in_played_hand + 1
                        end
                    end
                end
                if fours_in_played_hand > 0 then
                    local total_mult = fours_in_played_hand * card.ability.extra.mult_per_four
                    return {
                        mult = total_mult
                    }
                end
            end
        end
        return nil
    end
  
}
return { name = {"Jokers"}, items = {square_eyes} }
