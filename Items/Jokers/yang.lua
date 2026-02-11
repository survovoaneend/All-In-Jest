local yang = {
    object_type = "Joker",
    order = 540,
    key = "yang",
    
    config = {
        extra = {
            mult = 5
        }
    },
    rarity = 1,
    pos = { x = 24, y = 25 },
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
            if context.other_card:is_suit('Hearts') or context.other_card:is_suit('Diamonds') then
                local light_suits = { Hearts = 0, Diamonds = 0 }
                for _, played_card in ipairs(context.scoring_hand) do
                    if played_card:is_suit('Hearts') then light_suits.Hearts = 1 end
                    if played_card:is_suit('Diamonds') then light_suits.Diamonds = 1 end
                end
                local unique_count = light_suits.Hearts + light_suits.Diamonds
                
                if unique_count > 0 then
                    return {
                        mult = unique_count * card.ability.extra.mult
                    }
                end
            end
        end
    end
}

return { name = { "Jokers" }, items = { yang } }
