local calculate_average_eights = function()
    local eights = 0
    local hands = 0
    if G.GAME and G.GAME.all_in_jest and G.GAME.all_in_jest.advanced_hand_usage_run then
        for i = 1, #G.GAME.all_in_jest.advanced_hand_usage_run do
            local hand = G.GAME.all_in_jest.advanced_hand_usage_run[i]
            local scoring_hand = hand['scoring_hand']
            if scoring_hand then
                for j = 1, #scoring_hand do
                    local cur_card = scoring_hand[j] -- Card is a saveTable, so we need to load it to do proper stuff
                    if not (cur_card.save_fields.center == 'm_aij_canvas' or cur_card.save_fields.aij_other_center == 'm_aij_canvas') then -- Only load cards that can have a rank of 8 (or are rankless)
                        if cur_card.considered_rank == 8 then -- considered_rank is the card ran through :get_id() which is more important than base id
                            eights = eights + 1
                        end
                    end
                end
                hands = hands + 1
            end
        end
    end
    return eights, hands
end

local spiders_georg = {
    object_type = "Joker",
    order = 205,

    key = "spiders_georg",
    config = {
        extra = {
            base_xmult = 1 -- Purely so silver/dongtong can do something
        }
    },
    attributes = { 'xmult', 'rank', 'eight' },
    rarity = 2,
    pos = { x = 19, y = 7},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        eights, hands = calculate_average_eights()
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
            eights, hands = calculate_average_eights()

            -- To account for current hand
            if context.scoring_hand then
                for j = 1, #context.scoring_hand do
                    local cur_card = context.scoring_hand[j]
                    if cur_card and cur_card:get_id() and cur_card:get_id() == 8 then
                        eights = eights + 1
                    end
                end
            end
            hands = hands + 1

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
