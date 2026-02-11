local circle_joker = {
    object_type = "Joker",
    order = 367,
    key = "circle_joker",

    config = {
        extra = {
            xmult = 3.14
        }
    },
    rarity = 3,
    pos = { x = 3, y = 17 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if #context.scoring_hand >= 2 then
                local strictly_increasing = true
                for i = 1, #context.scoring_hand - 1 do
                    if context.scoring_hand[i]:get_id() >= context.scoring_hand[i+1]:get_id() then
                        strictly_increasing = false
                        break
                    end
                end

                if strictly_increasing then
                    return {
                        xmult = card.ability.extra.xmult
                    }
                end
            end
        end
    end
}

return { name = { "Jokers" }, items = { circle_joker } }
