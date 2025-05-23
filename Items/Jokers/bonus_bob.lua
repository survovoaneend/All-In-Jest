local bonus_bob = {
    object_type = "Joker",
    order = 310,
    
    key = "bonus_bob",
    config = {
        extra = {
            xchips = 1.5
        }
    },
    rarity = 2,
    pos = { x = 7, y = 12},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
        return {
            vars = {
                card.ability.extra.xchips
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.config.center == G.P_CENTERS["m_bonus"] then
                return {
                    card = context.other_card,
                    xchips = card.ability.extra.xchips,
                }
            end
        end
    end,

    in_pool = function(self, args)
        if G.deck then
            if #G.deck.cards > 0 then
                for i = 1, #G.deck.cards do
                    if G.deck.cards[i].config.center == G.P_CENTERS["m_bonus"] then
                        return true
                    end
                end
            end
        end
        return false
    end,
  
}
return { name = {"Jokers"}, items = {bonus_bob} }
