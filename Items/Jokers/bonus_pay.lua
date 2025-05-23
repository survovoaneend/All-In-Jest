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
            if context.other_card.config.center == G.P_CENTERS["m_bonus"] then
                return {
                    card = context.other_card,
                    dollars = card.ability.extra.money,
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
return { name = {"Jokers"}, items = {bonus_pay} }
