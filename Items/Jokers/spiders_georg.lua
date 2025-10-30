local spiders_georg = {
    object_type = "Joker",
    order = 205,

    key = "spiders_georg",
    config = {
        extra = {
            base_xmult = 1 -- Purely so silver/dongtong can do something
        }
    },
    rarity = 2,
    pos = { x = 19, y = 7},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local eights = 0
        local hands = 0
        if G.all_in_jest and G.all_in_jest.advanced_hand_usage_run then
            for i = 1, #G.all_in_jest.advanced_hand_usage_run do
                local hand = G.all_in_jest.advanced_hand_usage_run[i]
                local scoring_hand = hand['scoring_hand']
                if scoring_hand then
                    for j = 1, #scoring_hand do
                        local cur_card = scoring_hand[j]
                        if scoring_hand[j] and scoring_hand[j]:get_id() and scoring_hand[j]:get_id() == 8 then
                            eights = eights + 1
                        end
                    end
                    hands = hands + 1
                end
            end
        end
        if hands == 0 or eights == 0 then
            return {
                vars = {
                    card.ability.extra.base_xmult, card.ability.extra.base_xmult
                }
            }
        else
            return {
                vars = {
                    card.ability.extra.base_xmult + (eights/hands), card.ability.extra.base_xmult
                }
            }
        end
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            local eights = 0
            local hands = 0

            -- To account for current hand
            for j = 1, #context.scoring_hand do
                local cur_card = context.scoring_hand[j]
                if context.scoring_hand and cur_card and cur_card:get_id() and cur_card:get_id() == 8 then
                    eights = eights + 1
                end
            end
            hands = hands + 1

            for i = 1, #G.all_in_jest.advanced_hand_usage_run do
                local hand = G.all_in_jest.advanced_hand_usage_run[i]
                local scoring_hand = hand['scoring_hand']
                for j = 1, #scoring_hand do
                    local cur_card = scoring_hand[j]
                    if scoring_hand and cur_card and cur_card:get_id() and cur_card:get_id() == 8 then
                        eights = eights + 1
                    end
                end
                hands = hands + 1
            end
            if hands == 0 or eights == 0 then
                return {
                    Xmult = card.ability.extra.base_xmult
                }
            else
                return {
                    Xmult = card.ability.extra.base_xmult + (eights/hands)
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {spiders_georg} }
