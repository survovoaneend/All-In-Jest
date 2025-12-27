local embroidery = {
    object_type = "Joker",
    order = 499,

    key = "embroidery",
    config = {
        extra = {
            chips = 50,
            mult = 10
        }
    },
    rarity = 2,
    pos = { x = 5, y = 24 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_aij_canvas
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.config.center == G.P_CENTERS["m_aij_canvas"] then
                if SMODS.has_no_rank(context.other_card) then
                    return {
                        chips = card.ability.extra.chips,
                    }
                else
                    return {
                        mult = card.ability.extra.mult,
                    }
                end
            end
        end
    end,

    in_pool = function(self, args)
        if G.deck then
            if #G.deck.cards > 0 then
                for i = 1, #G.deck.cards do
                    if G.deck.cards[i].config.center == G.P_CENTERS["m_aij_canvas"] then
                        return true
                    end
                end
            end
        end
        return false
    end,
}
return { name = { "Jokers" }, items = { embroidery } }
