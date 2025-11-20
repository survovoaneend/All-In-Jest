local parking_space = {
    object_type = "Joker",
    order = 408,

    key = "parking_space",
    config = {
      extra = {
        xmult = 2,
        target_slot = 1
      }
    },
    rarity = 2,
    pos = { x = 0, y = 16},
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.target_slot
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then 
                    my_pos = i 
                    break 
                end
            end

            if my_pos and my_pos == card.ability.extra.target_slot then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end

        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            local limit = #G.jokers.cards or 5
            card.ability.extra.target_slot = math.ceil(pseudorandom('parking_space') * limit)
            
            return {
                message = localize('k_reset'),
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {parking_space} }