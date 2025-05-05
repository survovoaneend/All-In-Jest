local silvio = {
    object_type = "Joker",
    order = 254,

    key = "silvio",
    config = {
        extra = {
        }
    },
    rarity = 4,
    unlock_condition = { hidden = true },
    pos = { x = 8, y = 0 },
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 8, y = 1 },

    loc_vars = function(self, info_queue, card)
        return {}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card and context.other_card:get_id() == 13 then
                local queen_count = 0
                if G.hand and G.hand.cards then
                    for _, hand_card in ipairs(G.hand.cards) do
                        if hand_card:get_id() == 12 then 
                            queen_count = queen_count + 1
                        end
                    end
                end

                
                if queen_count > 0 then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = queen_count,
                        card = card 
                    }
                end
            end
        end
    end
}
return { name = {"Jokers"}, items = {silvio} }

