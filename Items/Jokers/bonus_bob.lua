local bonus_bob = {
    object_type = "Joker",
    order = 310,
    
    key = "bonus_bob",
    config = {
        extra = {
            xchips = 1.5
        }
    },
    rarity = 3,
    pos = { x = 7, y = 12},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    enhancement_gate = "m_bonus",
  
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
            if SMODS.has_enhancement(context.other_card, 'm_bonus') then
                return {
                    xchips = card.ability.extra.xchips,
                }
            end
        end
    end,
  
}
return { name = {"Jokers"}, items = {bonus_bob} }
