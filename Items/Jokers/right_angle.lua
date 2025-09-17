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
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.before then
            for i = 1, #G.hand.cards do
                if G.hand.cards[i]:get_id() == 10 and not G.hand.cards[i].highlighted then
                    highlight_card(G.hand.cards[i])
                end
            end
        end
        if context.after then
            for i = 1, #G.hand.cards do
                G.E_MANAGER:add_event(Event({func = function() highlight_card(G.hand.cards[i],nil,'down'); return true end }))
            end
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 9 then
                for k, v in pairs(G.hand.cards) do
                    if v:get_id() == 10 then
                        SMODS.score_card(v, context) 
                    end
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {right_angle} }
