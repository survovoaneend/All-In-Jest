local police_sketch = {
    object_type = "Joker",
    order = 400,
    key = "police_sketch",
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 23, y = 14 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_aij_canvas
        return {
            vars = {
                
            }
        }
        
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint and context.scoring_name == 'Four of a Kind' then
            local triggered = false
            
            for _, played_card in ipairs(context.full_hand) do
                local is_scoring = false
                
                for _, scoring_card in ipairs(context.scoring_hand) do
                    if played_card == scoring_card then
                        is_scoring = true
                        break
                    end
                end
                
                
                if not is_scoring then
                    played_card:set_ability(G.P_CENTERS.m_aij_canvas) 
                    played_card:juice_up()
                    triggered = true
                end
            end
            
            if triggered then
                return {
                    message = 'Canvas!',
                    card = card
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { police_sketch } }
