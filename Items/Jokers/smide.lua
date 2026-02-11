local smide = {
    object_type = "Joker",
    order = 429,
    key = "smide",
    
    config = {
        extra = {
            chips = 7
        }
    },
    rarity = 1,
    pos = { x = 2, y = 21 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        local faces = 0
        if G.playing_cards then
            for _, v in ipairs(G.playing_cards) do
                if v:is_face() then faces = faces + 1 end
            end
        end
        return { vars = { card.ability.extra.chips, faces * card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local faces = 0
            for _, v in ipairs(G.playing_cards) do
                if v:is_face() then faces = faces + 1 end
            end
            return {
                chips = faces * card.ability.extra.chips
            }
        end
    end
}

return { name = { "Jokers" }, items = { smide } }
