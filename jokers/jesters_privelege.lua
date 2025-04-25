SMODS.Joker {
    key = "jesters_privelege",
    config = {
      
    },
    rarity = 3,
    pos = { x = 15, y = 3 },
    atlas = 'joker_atlas',
    cost = 10,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.reroll_shop and not context.blueprint then
        local rare_jokers = {}
        for _, v in ipairs(G.shop_jokers.cards) do
            if v.config.center.rarity == 3 then
                table.insert(rare_jokers, v)
            end
        end
        for _, j in ipairs(rare_jokers) do
            if pseudorandom('jesters_privelege') < 0.2 then
                j:juice_up(0.3, 0.4)
                local c = G.shop_jokers:remove_card(j)
                c:remove()
                c = nil

                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    blockable = false,
                    blocking = true,
                    func = function()
                       
                        local joker = create_card("Joker", G.shop_jokers, true, 4, nil, nil, nil, nil)
                        create_shop_card_ui(joker)
                        joker:set_cost()
                        G.shop_jokers:emplace(joker)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        return true
                    end
                }))
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Legendary"})
            end
        end
    end
end
}