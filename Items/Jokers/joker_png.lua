local joker_png = {
    object_type = "Joker",
    order = 302,
    key = "joker_png",
    config = {
      
    },
    rarity = 1,
    pos = { x = 24, y = 11},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    pixel_size = { w = 31, h = 40 },
  
    loc_vars = function(self, info_queue, card)
        
    end,
  
    calculate = function(self, card, context)
        if context.setting_blind then
            local jokers = {}
            for k,v in pairs(G.P_CENTER_POOLS["Joker"]) do
                if v.discovered and v.rarity ~= 4 then
                    if v.in_pool and type(v.in_pool) == 'function' then
                        if v:in_pool() then
                            jokers[#jokers+1] = v
                        end
                    else
                        jokers[#jokers+1] = v
                    end
                end
            end
            local joker_center = pseudorandom_element(jokers, pseudoseed('joker_png'))
            All_in_Jest.reroll_joker(card, joker_center.key, 'joker_png', card.config.center.key)
        end
    end
  
}
return { name = {"Jokers"}, items = {joker_png} }
