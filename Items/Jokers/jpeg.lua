local jpeg = {
    object_type = "Joker",
    order = 336,
    
    key = "jpeg",
    config = {
    },
    rarity = 2,
    pos = { x = 7, y = 13},
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
    end,
  
    calculate = function(self, card, context)
         if context.before and G.GAME.current_round.hands_played == 0 and not context.blueprint then
            local suits = {}
            for _, v in ipairs(context.full_hand) do
                if suits[v.base.suit] then return end
                suits[v.base.suit] = true
            end
            
            local triggered = false
            for _, v in ipairs(context.scoring_hand) do
                if v.config.center == G.P_CENTERS.c_base then
                    v:set_ability(G.P_CENTERS.m_wild)
                    v:juice_up()
                    triggered = true
                end
            end
            if triggered then
                return {
                    extra = {message = localize{type = 'name_text', set = 'Enhanced', key = 'm_wild'} .. "!"}
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {jpeg} }
