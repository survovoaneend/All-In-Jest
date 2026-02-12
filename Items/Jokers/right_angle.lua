local right_angle = {
    object_type = "Joker",
    order = 66,

    key = "right_angle",
    config = {
      
    },
    rarity = 2,
    pos = { x = 12, y = 2 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.before then
            local nine_in_hand = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == 9 and not context.scoring_hand[i].debuff then
                    nine_in_hand = true
                    break
                end
            end
            if nine_in_hand then
                local percent = 1
                for i = 1, #G.hand.cards do
                    if G.hand.cards[i]:get_id() == 10 and not G.hand.cards[i].highlighted then
                        highlight_card(G.hand.cards[i], (percent - 0.999)/#G.hand.cards)
                        percent = percent + 1
                    end
                end
            end
        end
        -- Destroy glass cards
        if context.destroy_card and context.cardarea == G.hand then
            local nine_in_hand = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == 9 and not context.scoring_hand[i].debuff then
                    nine_in_hand = true
                    break
                end
            end
            if nine_in_hand then
                if context.destroy_card:get_id() == 10 then
                    local new_context = {
                        full_hand = context.full_hand,
                        scoring_hand = context.scoring_hand,
                        scoring_name = context.scoring_name,
                        poker_hands = context.poker_hands,
                        destroy_card = context.destroy_card,
                        destroying_card = context.destroy_card,
                        cardarea = G.play,
                    }
                    return SMODS.calculate_context(new_context)
                end
            end
        end
        if context.after then
            G.E_MANAGER:add_event(Event({func = function()
                local percent = 1
                for k, v in pairs(G.hand.cards) do
                    if v.highlighted then
                        -- sendDebugMessage(percent, "AIJ")
                        highlight_card(v,(percent - 0.999)/#G.hand.cards,'down')
                        percent = percent + 1
                        -- v.highlighted = false
                    end
                end
                return true
            end }))
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 9 then
                local juiced_card = context.blueprint_card or card
                return {
                    card = juiced_card,
                    func = function ()
                        for k, v in pairs(G.hand.cards) do
                            if v:get_id() == 10 then
                                G.E_MANAGER:add_event(Event({func = function()
                                    juiced_card:juice_up()
                                    return true
                                end }))
                                local new_context = {
                                  cardarea = context.cardarea,
                                  full_hand = context.full_hand,
                                  scoring_hand = context.scoring_hand,
                                  scoring_name = context.scoring_name,
                                  poker_hands = context.poker_hands
                                }
                                SMODS.score_card(v, new_context)
                            end
                        end
                    end
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {right_angle} }
