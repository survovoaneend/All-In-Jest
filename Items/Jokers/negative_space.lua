local negative_space = {
    object_type = "Joker",
    order = 316,
    key = "negative_space",
    config = {
        extra = {
            hand_size = 1,
            prev_handsize = "0",
            max_handsize = 5
        }
    },
    rarity = 2,
    pos = { x = 12, y = 12 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    in_pool = function(self, args)
        if G.jokers and G.jokers.cards then
            for _, card in ipairs(G.jokers.cards) do
                if card.edition and card.edition.key == 'e_negative' then
                    return true
                end
            end
        end
    end,
    loc_vars = function(self, info_queue, card)
        local handsize = 0
        if G.jokers then
            for i = 1, #G.jokers.cards do
                local v = G.jokers.cards[i]
                if v.edition ~= nil and v.edition.negative ~= nil then
                    if v.edition.negative and handsize < card.ability.extra.max_handsize then
                        handsize = handsize + card.ability.extra.hand_size
                    end
                end
            end
        end
        return {
            vars = {
                card.ability.extra.hand_size,
                handsize,
                card.ability.extra.max_handsize
            }
        }
    end,

    update = function(self, card, dt)
        if G.jokers and G.jokers.cards then
            local handsize = 0
            for i = 1, #G.jokers.cards do
                local v = G.jokers.cards[i]
                if v.edition ~= nil and v.edition.negative ~= nil and handsize < card.ability.extra.max_handsize then
                    if v.edition.negative then
                        handsize = handsize + card.ability.extra.hand_size
                    end
                end
            end
            card.ability.extra.prev_handsize = tostring(tonumber(card.ability.extra.prev_handsize) or 0)
            if handsize ~= prev_handsize and card.area == G.jokers then
                G.hand:change_size(handsize - tonumber(card.ability.extra.prev_handsize))
                card.ability.extra.prev_handsize = tostring(handsize)
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-tonumber(card.ability.extra.prev_handsize))
    end,

}
return { name = { "Jokers" }, items = { negative_space } }
