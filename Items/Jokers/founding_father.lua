local founding_father = {
    object_type = "Joker",
    order = 25,
     
    key = "founding_father",
    config = {
      
    },
    rarity = 3,
    pos = { x = 23, y = 0 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    in_pool = function(self, args)
        if G.deck then
            if #G.deck.cards > 0 then
                for i = 1, #G.deck.cards do
                    if G.deck.cards[i].config.center == G.P_CENTERS["m_aij_charged"] then
                        return true
                    end
                end
            end
        end
        return false
    end,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_aij_charged
    end,
  
    calculate = function(self, card, context)
      
    end 
}
-- Override in charged.lua
return { name = {"Jokers"}, items = {founding_father} }
