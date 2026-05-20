local blemmya = {
    object_type = "Joker",
    order = 466,
    key = "blemmya",
    
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 8, y = 23 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            if #context.full_hand % 2 == 1 then
                local mid_index = math.ceil(#context.full_hand / 2)
                local mid_card = {context.full_hand[mid_index]}
                
                -- Convert rank
                local new_rank = pseudorandom_element({'Jack', 'Queen', 'King'}, 'blemmya')
                All_in_Jest.change_card(nil, new_rank, mid_card)
                
                return {
                    message = localize('k_aij_change_ex'),
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { blemmya } }
