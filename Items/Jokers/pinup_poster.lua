local pinup_poster = {
    object_type = "Joker",
    order = 828,

    key = "pinup_poster",
    config = {
        extra = {
            xmult_gain = 0.2
        }
    },
    attributes = { 'xmult', 'scaling', 'stickers', 'full_deck', 'suit', 'hearts' },
    rarity = 3,
    pos = { x = 2, y = 39},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local count = 0
        for _, c in ipairs(G.deck and G.deck.cards or {}) do
            if c:is_suit('Hearts') then
                count = count + 1
            end
        end
        return { vars = { card.ability.extra.xmult_gain, 1 + (count * card.ability.extra.xmult_gain) } }
    end,

    set_ability = function(self, card, initial)
        card.ability = card.ability or {}
        card.ability.aij_pinned = true
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local count = 0
            for _, c in ipairs(G.deck and G.deck.cards or {}) do
                if c:is_suit('Hearts') then
                    count = count + 1
                end
            end
            if count > 0 then
                return {
                    xmult = 1 + (count * card.ability.extra.xmult_gain)
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {pinup_poster} }