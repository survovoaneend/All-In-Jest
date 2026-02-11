local propaganda = {
    object_type = "Joker",
    order = 408,
    key = "propaganda",
    
    config = {
        extra = {
            mult = 5
        }
    },
    rarity = 2,
    pos = { x = 15, y = 14 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local suit_counts = { Spades = 0, Hearts = 0, Clubs = 0, Diamonds = 0 }
            for _, v in ipairs(G.playing_cards) do
                if v.base.suit then suit_counts[v.base.suit] = suit_counts[v.base.suit] + 1 end
            end
            
            local max_count = 0
            local target_suit = ""
            for suit, count in pairs(suit_counts) do
                if count > max_count then
                    max_count = count
                    target_suit = suit
                end
            end
        return {
            vars = {
                target_suit or 'None',
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local suit_counts = { Spades = 0, Hearts = 0, Clubs = 0, Diamonds = 0 }
            for _, v in ipairs(G.playing_cards) do
                if v.base.suit then suit_counts[v.base.suit] = suit_counts[v.base.suit] + 1 end
            end
            
            local max_count = 0
            local target_suit = ""
            for suit, count in pairs(suit_counts) do
                if count > max_count then
                    max_count = count
                    target_suit = suit
                end
            end

            if context.other_card:is_suit(target_suit) then
                return {
                    mult = card.ability.extra.mult,
                    card = card
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { propaganda } }
