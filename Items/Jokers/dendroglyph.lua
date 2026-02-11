local dendroglyph = {
    object_type = "Joker",
    order = 323,

    key = "dendroglyph",
    config = {
        extra = {
            mult = 4
        }
    },
    rarity = 2,
    pos = { x = 19, y = 12 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    in_pool = function(self, args)
        if G.deck then
            if #G.deck.cards > 0 then
                for i = 1, #G.deck.cards do
                    if G.deck.cards[i].config.center == G.P_CENTERS["m_aij_wood"] then
                        return true
                    end
                end
            end
        end
        return false
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_aij_wood
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_aij_wood') then
            local woods = 0
            if G.hand and G.hand.cards then
                for _, hand_card in ipairs(G.hand.cards) do
                    if SMODS.has_enhancement(hand_card, 'm_aij_wood') then
                        woods = woods + 1
                    end
                end
            end
            if woods > 0 then
                local total_mult = woods * card.ability.extra.mult
                return {
                    mult = total_mult
                }
            end
        end
    end

}
return { name = { "Jokers" }, items = { dendroglyph } }
