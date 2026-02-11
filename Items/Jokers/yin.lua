local yin = {
    object_type = "Joker",
    order = 539,
    key = "yin",
    
    config = {
        extra = {
            mult = 5
        }
    },
    rarity = 2,
    pos = { x = 23, y = 25 },
    atlas = 'joker_atlas',
    cost = 6,
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
            if context.other_card:is_suit('Spades') or context.other_card:is_suit('Clubs') then
                local dark_suits = { Spades = 0, Clubs = 0 }
                for _, played_card in ipairs(context.scoring_hand) do
                    if played_card:is_suit('Spades') then dark_suits.Spades = 1 end
                    if played_card:is_suit('Clubs') then dark_suits.Clubs = 1 end
                end
                local unique_count = dark_suits.Spades + dark_suits.Clubs
                
                if unique_count > 0 then
                    return {
                        mult = unique_count * card.ability.extra.mult
                    }
                end
            end
        end
    end
}

return { name = { "Jokers" }, items = { yin } }
