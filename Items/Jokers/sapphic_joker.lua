local sapphic_joker = {
    object_type = "Joker",
    order = 893,

    key = "sapphic_joker",
    config = {
        extra = {
            chips = 3,
            mult = 1
        }
    },
    attributes = {'chips', 'mult', 'queen', 'rank'},
    rarity = 1,
    pos = { x = 14, y = 41},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        local queen_count = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:get_id() == 12 then
                    queen_count = queen_count + 1
                end
            end
        end

        return { 
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips,
                card.ability.extra.mult * queen_count,
                card.ability.extra.chips * queen_count,
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 12 then
            local queen_count = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:get_id() == 12 then
                        queen_count = queen_count + 1
                    end
                end
            end

            if queen_count > 0 then
                return {
                    mult = card.ability.extra.mult * queen_count,
                    chips = card.ability.extra.chips * queen_count,
                    card = card
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {sapphic_joker} }