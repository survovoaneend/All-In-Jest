local geoglyph = {
    object_type = "Joker",
    order = 427,
    key = "geoglyph",
    
    config = {
        extra = {
            mult = 1
        }
    },
    rarity = 1,
    pos = { x = 7, y = 20 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
               card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local matches = 0
            for _, hand_card in ipairs(G.hand.cards) do
                if hand_card:is_suit(context.other_card.base.suit) then
                    matches = matches + 1
                end
            end
            if matches > 0 then
                return {
                    mult = matches * card.ability.extra.mult
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { geoglyph } }
