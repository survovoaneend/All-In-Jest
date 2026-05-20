local dot_matrix = {
    object_type = "Joker",
    order = 653,

    key = "dot_matrix",
    config = {
        extra = {
            mult = 1
        }
    },
    rarity = 1,
    pos = { x = 20, y = 30},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local unique_ranks = {}
        local count = 0
        for _, c in ipairs(G.deck and G.deck.cards or {}) do
            if not SMODS.has_no_rank(c) then
                local id = c:get_id()
                if not unique_ranks[id] then
                    unique_ranks[id] = true
                    count = count + 1
                end
            end
        end
        return { vars = { card.ability.extra.mult, count * card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local unique_ranks = {}
            local count = 0
            for _, c in ipairs(G.deck and G.deck.cards or {}) do
                if not SMODS.has_no_rank(c) then
                    local id = c:get_id()
                    if not unique_ranks[id] then
                        unique_ranks[id] = true
                        count = count + 1
                    end
                end
            end
            if count > 0 then
                return {
                    mult = count * card.ability.extra.mult
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {dot_matrix} }