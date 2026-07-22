local slippery_when_wet = {
    object_type = "Joker",
    order = 24,

    key = "slippery_when_wet",
    config = {
      
    },
    rarity = 1,
    pos = { x = 22, y = 0 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
        local pos = nil
        for i = 1, #context.full_hand do 
            if context.full_hand[i] == context.other_card then
                pos = i
                break
            end
        end
        local left_card = context.full_hand[pos - 1]
        local right_card = context.full_hand[pos + 1]
        if left_card or right_card then
            local left_rank = 0
            local right_rank = 0
            if left_card and not SMODS.has_no_rank(left_card) then
                left_rank = math.max(left_card:get_id(), 0)
            end
            if right_card and not SMODS.has_no_rank(right_card) then
                right_rank = math.max(right_card:get_id(), 0)
            end
            if left_rank + right_rank > 0 then
                return {
                    chips = left_rank + right_rank
                }
            end
        end
      end
    end
  
}
return { name = {"Jokers"}, items = {slippery_when_wet} }
