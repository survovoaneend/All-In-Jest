local mariachi = {
    object_type = "Joker",
    order = 632,

    key = "mariachi",
    config = {
        extra = {
            mult = 4
        }
    },
    rarity = 1,
    pos = { x = 24, y = 29},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local unique_enhancements = {}
        local count = 0
        for _, c in ipairs(G.playing_cards or {}) do
            for k, v in pairs(SMODS.get_enhancements(c)) do
                if v and not unique_enhancements[k] then
                    unique_enhancements[k] = true
                    count = count + 1
                end
            end
        end
        return { vars = { card.ability.extra.mult, count * card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local unique_enhancements = {}
            local count = 0
            for _, c in ipairs(G.playing_cards or {}) do
                for k, v in pairs(SMODS.get_enhancements(c)) do
                    if v and not unique_enhancements[k] then
                        unique_enhancements[k] = true
                        count = count + 1
                    end
                end
            end
            if count > 0 then
                return {
                    mult = count * card.ability.extra.mult
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {mariachi} }