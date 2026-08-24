local profile = {
    object_type = "Joker",
    order = 821,

    key = "profile",
    config = {
        extra = {
            mult = 5
        }
    },
    attributes = { "mult", "face"},
    rarity = 1,
    pos = { x = 2, y = 38},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
         if context.individual and context.cardarea == G.play then
            local scoring_hand = context.scoring_hand
            local other_card = context.other_card

            if scoring_hand then
                for i = 1, #scoring_hand do
                    if scoring_hand[i] == other_card then
                        local left_card = scoring_hand[i - 1]
                        local right_card = scoring_hand[i + 1]

                        local left_is_face = left_card and left_card:is_face()
                        local right_is_face = right_card and right_card:is_face()

                        if left_is_face or right_is_face then
                            return {
                                mult = card.ability.extra.mult,
                                card = card
                            }
                        end
                    end
                end
            end
        end
    end
}
return { name = {"Jokers"}, items = {profile} }