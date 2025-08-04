local circuit_diagram = {
    object_type = "Joker",
    order = 287,
    key = "circuit_diagram",
    config = {
      
    },
    rarity = 3,
    pos = { x = 10, y = 11},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_aij_charged
    end,
  
    calculate = function(self, card, context)
        
    end,
    in_pool = function(self, args)
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.config.center == G.P_CENTERS["m_aij_charged"] then
                    return true
                end
            end
        end
        return false
    end,
  
}
return { name = {"Jokers"}, items = {circuit_diagram} }
