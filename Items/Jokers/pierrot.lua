local pierrot = {
    object_type = "Joker",
    order = 11,

    key = "pierrot",
    config = {
      
    },
    rarity = 1,
    pos = { x = 10, y = 0 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.before then
            for i = 1, #G.hand.cards do
                if not G.hand.cards[i].debuff then
                    local id = G.hand.cards[i]:get_id()
                    local rank = SMODS.Ranks[G.hand.cards[i].base.value]
                    if to_big(G.hand.cards[i]:get_chip_bonus()) > to_big(0) and (to_big(id) > to_big(0) and rank and not rank.face) and not G.hand.cards[i].highlighted then
                        highlight_card(G.hand.cards[i])
                    end
                end
            end
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            local val = context.other_card:get_chip_bonus()
            local id = context.other_card:get_id()
            local rank = SMODS.Ranks[context.other_card.base.value]
            if context.other_card and to_big(context.other_card:get_chip_bonus()) > to_big(0) and (to_big(id) > to_big(0) and rank and not rank.face) then
                SMODS.score_card(context.other_card, {cardarea = G.play, all_in_jest = { main_scoring_chip_vaules = true }})
            end
        end
        if context.after then
            for i = 1, #G.hand.cards do
                G.E_MANAGER:add_event(Event({func = function() highlight_card(G.hand.cards[i],nil,'down'); return true end }))
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {pierrot} }
