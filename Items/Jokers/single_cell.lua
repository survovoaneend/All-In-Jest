local single_cell = {
    object_type = "Joker",
    order = 453,
    key = "single_cell",
    
    config = {
        extra = {
            chips = 100
        }
    },
    rarity = 2,
    pos = { x = 21, y = 22 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local first_num
            for _, v in ipairs(context.scoring_hand) do
                if v:get_id() >= 2 and v:get_id() <= 10 then
                    first_num = v
                    break
                end
            end
            
            if context.other_card == first_num then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { single_cell } }
