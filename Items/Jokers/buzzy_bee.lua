local buzzy_bee = {
    object_type = "Joker",
    order = 987,

    key = "buzzy_bee",
    config = {
        extra = {
            chips = 10
        }
    },
    attributes = {'chips', 'six', 'rank'},
    rarity = 2,
    pos = { x = 11, y = 45},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        local count = 0
        if G.playing_cards then
            for _, c in ipairs(G.playing_cards) do
                if c:get_id() == 6 then count = count + 1 end
            end
        end
        return { 
            vars = { 
                card.ability.extra.chips, 
                card.ability.extra.chips * count 
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card:get_id() == 6 then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED
                    }
                else
                    local count = 0
                    for _, c in ipairs(G.playing_cards or {}) do
                        if c:get_id() == 6 then count = count + 1 end
                    end
                    return {
                        chips = card.ability.extra.chips * count
                    }
                end
            end
        end
    end
}
return { name = {"Jokers"}, items = {buzzy_bee} }