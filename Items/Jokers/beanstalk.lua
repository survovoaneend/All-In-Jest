local beanstalk = {
    object_type = "Joker",
    order = 194,
    
    key = "beanstalk",
    config = {
      
    },
    rarity = 1,
    pos = { x = 8, y = 7},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end,

    update = function(self, card, dt)
        if G.hand then
            if #G.hand.cards > 0 then
                for i = 1, #G.hand.cards do
                    if G.hand.cards[i]:get_id() == 11 and G.hand.cards[i].debuff then
                        G.hand.cards[i].debuff = false
                    end
                end
            end
        end
        if G.play then
            if #G.play.cards > 0 then
                for i = 1, #G.play.cards do
                    if G.play.cards[i]:get_id() == 11 and G.play.cards[i].debuff then
                        G.play.cards[i].debuff = false
                    end
                end
            end
        end
        if G.deck then
            if #G.deck.cards > 0 then
                for i = 1, #G.deck.cards do
                    if G.deck.cards[i]:get_id() == 11 and G.deck.cards[i].debuff then
                        G.deck.cards[i].debuff = false
                    end
                end
            end
        end
    end,
}
return { name = {"Jokers"}, items = {beanstalk} }
