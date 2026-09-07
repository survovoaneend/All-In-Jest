local pangram = {
    object_type = "Joker",
    order = 983,

    key = "pangram",
    config = {
        extra = {
            xmult_gain = 0.2,
            xmult_base = 1,
        }
    },
    attributes = {'xmult', 'rank'},
    rarity = 2,
    pos = { x = 6, y = 45},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        local unique_ranks = 0
        if G.hand and G.hand.cards then
            local ranks = {}
            for _, c in ipairs(G.hand.cards) do
                if not SMODS.has_no_rank(c) and not c.debuff then
                    local id = c:get_id()
                    if not ranks[id] then
                        ranks[id] = true
                        unique_ranks = unique_ranks + 1
                    end
                end
            end
        end
        return { 
            vars = 
                { 
                    card.ability.extra.xmult_gain, 
                    card.ability.extra.xmult_base + card.ability.extra.xmult_gain * unique_ranks 
                } 
        }
    end,

    calculate = function(self, card, context)
         if context.joker_main then
            local ranks = {}
            local unique_ranks = 0
            for _, c in ipairs(G.hand.cards) do
                if not SMODS.has_no_rank(c) and not c.debuff then
                    local id = c:get_id()
                    if not ranks[id] then
                        ranks[id] = true
                        unique_ranks = unique_ranks + 1
                    end
                end
            end
            local xmult = card.ability.extra.xmult_base + (card.ability.extra.xmult_gain * unique_ranks)
            if xmult > 1 then
                return {
                    xmult = xmult
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {pangram} }