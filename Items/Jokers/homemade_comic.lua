local homemade_comic = {
    object_type = "Joker",
    order = 300,
     ignore = true,
    key = "homemade_comic",
    config = {
       xmult = 1.5
    },
    rarity = 1,
    pos = { x = 20, y = 11},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
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
        return { vars = { card.ability.xmult }}
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.config.center == G.P_CENTERS["m_aij_charged"] then
                return {
                  card = context.other_card,
                  xmult = card.ability.xmult,
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {homemade_comic} }
