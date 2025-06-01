local pygmalion = {
    object_type = "Joker",
    order = 280,
     
    key = "pygmalion",
    config = {
       
    },
    rarity = 1,
    pos = { x = 1, y = 11},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    in_pool = function(self, args)
        if G.deck then
            if #G.deck.cards > 0 then
                for i = 1, #G.deck.cards do
                    if G.deck.cards[i].config.center == G.P_CENTERS["m_stone"] then
                        return true
                    end
                end
            end
        end
        return false
    end,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
    end,
  
    calculate = function(self, card, context)
        
    end
  
}
return { name = {"Jokers"}, items = {pygmalion} }
