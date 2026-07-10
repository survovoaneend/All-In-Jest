local bonus_pay = {
    object_type = "Joker",
    order = 307,

    key = "bonus_pay",
    config = {
        extra = {
            money = 3
        }
    },
    rarity = 1,
    pos = { x = 4, y = 12},
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    enhancement_gate = "m_bonus",
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
        return {
            vars = {
                card.ability.extra.money
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_bonus')then
                return {
                    dollars = card.ability.extra.money,
                }
            end
        end
    end,
  
}
return { name = {"Jokers"}, items = {bonus_pay} }
