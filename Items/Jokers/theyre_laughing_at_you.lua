local theyre_laughing_at_you = {
    object_type = "Joker",
    order = 257,
    
    key = "theyre_laughing_at_you",
    config = {
      
    },
    rarity = 3,
    pos = { x = 4, y = 10},
    atlas = 'joker_atlas',
    cost = 10,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and context.beat_boss and not context.blueprint then
            local common_jokers = {}
            for _, j in ipairs(G.jokers.cards) do
                if j.config.center.rarity == 1 and not j.edition then 
                    table.insert(common_jokers, j)
                end
            end
            
            if #common_jokers > 0 then
                local chosen_joker = pseudorandom_element(common_jokers, 'laughing')
                chosen_joker:set_edition('e_negative', true)
                return {
                    message = localize('k_aij_editioned_ex'), 
                    colour = G.C.DARK_EDITION
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {theyre_laughing_at_you} }
