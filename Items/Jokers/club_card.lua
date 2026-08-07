local club_card = {
    object_type = "Joker",
    order = 807,

    key = "club_card",
    config = {
        extra = {
            xmult = 2,
            min_clubs = 20
        }
    },
    attributes = {},
    rarity = 2,
    pos = { x = 12, y = 36},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local club_count = 0
        if G.GAME and G.playing_cards then
            for _, v in ipairs(G.playing_cards) do
                if v:is_suit('Clubs') then
                    club_count = club_count + 1
                end
            end
        end
        return { 
            vars = { 
                card.ability.extra.xmult, 
                card.ability.extra.min_clubs, 
                club_count 
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local club_count = 0
            if G.playing_cards then
                for _, v in ipairs(G.playing_cards) do
                    if v:is_suit('Clubs') then
                        club_count = club_count + 1
                    end
                end
            end

            if club_count >= card.ability.extra.min_clubs then
                return {
                    Xmult = card.ability.extra.xmult
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {club_card} }