local valentine = {
    object_type = "Joker",
    order = 378,
    key = "valentine",
    
    config = {
        extra = {
            x_mult = 1.5
        }
    },
    rarity = 2,
    pos = { x = 20, y = 16 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local ranks = {}
            for _, played_card in ipairs(context.full_hand) do
                local id = played_card:get_id()
                if id > 0 then 
                    ranks[id] = (ranks[id] or 0) + 1
                end
            end

            local unique_pairs = 0
            for id, count in pairs(ranks) do
                if count >= 2 then
                    unique_pairs = unique_pairs + 1
                end
            end

            if unique_pairs > 0 then
                return {
                    xmult = card.ability.extra.x_mult * unique_pairs
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { valentine } }
